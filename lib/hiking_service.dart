import 'dart:math';

import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:hiking_app/location_service.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:hiking_app/models/location_accuracy_type.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:intl/intl.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:rxdart/rxdart.dart';

import 'archive_service.dart';
import 'filters/location_filter.dart';
import 'models/plot_values.dart';
import 'models/trip_archive.dart';
import 'models/trip_status.dart';

const int millisecondsPerSecond = 1000;
const double MilesPerHourPerMetersPerSecond = 2.23694;

// - 500 foot jump on Mom's phone that was not counted in cumulative ascent/descent

/// Number of seconds between updates
const int updateIntervalSec = 10;

/// Minimum distance between location updates published to UI.
/// TODO: Dynamically update this based on instantaneous accuracy.
const int minimumDistanceThreshold = 4;

class HikingService {
  final LocationService _locationService;
  TripStatus _hikeStatus = TripStatus.stopped;
  double _lastUpdateTimeSec = 0.0;
  PlotValues? elevationPlotValues;
  PlotValues? speedPlotValues;
  ArchiveService archiveService = ArchiveService();

  /// List of all points for the current hike
  final List<LocationStatus> _currentPath = [];
  final List<LocationStatus> _unfilteredPath = [];
  final List<LocationStatus> _segmentCurrentPath = [];
  final List<LocationStatus> _segmentUnfilteredPath = [];

  TripArchive? _currentTrip;
  TripSegment? _segmentCurrentTrip;
  bool isFirstLocation = true;

  int? reportPeriodSec;

  LocationFilter? locationFilter;

  /// Previous position used to determine when a location change is sufficiently large to warrant a hiker status update.
  LocationStatus? _prevLocation;
  HikeMetrics? _prevHikeMetrics;
  HikeMetrics? _segmentPrevHikeMetrics;

  final BehaviorSubject<TripStatus> _activeStatusSub =
      BehaviorSubject.seeded(TripStatus.stopped);
  final BehaviorSubject<HikeMetrics> _currentHikerMetricsSub =
      BehaviorSubject.seeded(const HikeMetrics());
  final BehaviorSubject<List<LocationStatus>> currentPathSub =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<LocationStatus>> currentRawPathSub =
      BehaviorSubject.seeded([]);

  final BehaviorSubject<List<LocationStatus>> currentSegmentPathSub =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<LocationStatus>> currentSegmentRawPathSub =
      BehaviorSubject.seeded([]);

  final BehaviorSubject<TripArchive?> currentTripSub =
      BehaviorSubject.seeded(null);

  HikingService({required LocationService locationService})
      : _lastUpdateTimeSec = 0,
        _locationService = locationService {
    _locationService.locationStream
        .where((_) => _hikeStatus == TripStatus.active)
        // .doOnData((event) => print("HIKER: location update received."))
        .map(toLocationStatus)
        .listen(_handleLocationUpdate);
    // updateCurrentLocation();
    // print("INITIALIZING ARCHIVE SUB ${archiveService.activeDataArchive.value}");
    archiveService.activeTripArchive.listen(_handleArchiveChange);
  }

  final BehaviorSubject<PlotValues> elevationPlot =
      BehaviorSubject<PlotValues>();
  final BehaviorSubject<PlotValues> speedPlot = BehaviorSubject<PlotValues>();

  Stream<TripStatus> get currentHikerStatus$ =>
      _activeStatusSub.stream.asBroadcastStream();

  BehaviorSubject<LocationStatus> get currentLocationStatus =>
      BehaviorSubject<LocationStatus>();

  Stream<HikeMetrics> get currentHikerMetrics$ =>
      _currentHikerMetricsSub.stream.asBroadcastStream();
  Stream<TripArchive?> get currentTrip$ =>
      currentTripSub.stream.asBroadcastStream();

  Future<String?> updateStatus(BuildContext context,
      HikingService hikingService, TripStatusCommand statusCommand) async {
    TripStatus requestedStatus = statusCommand.newStatus;
    if (requestedStatus == TripStatus.active) {
      // if (!await hikingService._locationService.locationAlwaysGranted()) {
      //   await showDialog(
      //     context: context,
      //     builder: (BuildContext context) => locationDisclosurePopup(context),
      //   );
      // }

      final locationAlwaysEnabled =
          await hikingService._locationService.requestEnableLocationAlways();
      final gpsEnabled =
          await hikingService._locationService.requestEnableGps();
      if (gpsEnabled && locationAlwaysEnabled) {
        _hikeStatus = requestedStatus;
        _activeStatusSub.add(_hikeStatus);
      } else {
        var reason = "";
        if (!gpsEnabled) {
          reason += "\n- GPS disabled";
        }
        if (!locationAlwaysEnabled) {
          reason += "\n- Location permissions not allowed all the time";
        }
        await showDialog(
          context: context,
          builder: (BuildContext context) => locationPopup(context, reason),
        );
        return null;
      }
    } else {
      _hikeStatus = requestedStatus;
      _activeStatusSub.add(_hikeStatus);
    }

    if (statusCommand == TripStatusCommand.start) {
      hikingService._locationService.startLocationUpdates();
      _prevLocation = const LocationStatus();
      _currentPath.clear();
      _unfilteredPath.clear();
      _segmentCurrentPath.clear();
      _segmentUnfilteredPath.clear();
      elevationPlotValues = PlotValues(
        values: [],
        xFormat: const PlotFormat(
          axisTitle: "Time",
        ),
        yFormat: const PlotFormat(
          axisTitle: "Elevation (ft)",
        ),
        height: 150,
        width: 180,
      );
      speedPlotValues = PlotValues(
        values: [],
        xFormat: const PlotFormat(
          axisTitle: "Time",
        ),
        yFormat: const PlotFormat(
          axisTitle: "Speed (mi/hr)",
        ),
        height: 150,
        width: 180,
      );
    } else if (statusCommand == TripStatusCommand.unpause) {
      _currentTrip ??= const TripArchive();
      List<TripSegment> segments = _currentTrip!.tripSegments.toList();
      segments.add(const TripSegment());

      _currentTrip = _currentTrip!.copyWith(tripSegments: segments);
      currentTripSub.add(_currentTrip);
    } else if (statusCommand == TripStatusCommand.stop) {
      hikingService._locationService.stopLocationService();
      return archiveCurrentTripData();
    }
    return null;
  }

  void _handleArchiveChange(TripArchive? dataArchive) async {
    // print("ARCHIVE CAHANGING TO $dataArchive");
    currentTripSub.value = dataArchive;
    // currentPathSub.value = dataArchive.locationHistory!;
    // currentRawPathSub.value = dataArchive.unfilteredLocationHistory!;
    // elevationPlot.value = dataArchive.elevationPlot!;
    // speedPlot.value = dataArchive.speedPlot!;
  }

  Future<String> archiveCurrentTripData() async {
    final dataArchive = TripArchive(
        hikeMetrics: _currentHikerMetricsSub.value,
        locationHistory: currentPathSub.value,
        unfilteredLocationHistory: currentRawPathSub.value,
        elevationPlot: elevationPlot.value,
        speedPlot: speedPlot.value);
    DateTime now = DateTime.now();
    final name = DateFormat('yyyy-MM-dd_kk:mm:ss').format(now);
    await archiveService.createArchive(name, dataArchive);
    return name;
  }

  void clearData() {
    currentPathSub.add([]);
    currentRawPathSub.add([]);
    _currentHikerMetricsSub.add(const HikeMetrics());
    elevationPlot.add(PlotValues());
    speedPlot.add(PlotValues());
  }

  Widget locationDisclosurePopup(BuildContext context) {
    return AlertDialog(
      title: const Text('Location Permissions Disclosure'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("This hiking App collects location data to enable hiking data "
              "collection and analysis, even when the app is closed or "
              "not in use."),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
      ],
    );
  }

  Widget locationPopup(BuildContext context, String reason) {
    return AlertDialog(
      title: const Text('Location Requirements Not Satisfied'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "This application requires certain location permissions, which have not been met. The following requirements are not satisfied: $reason"),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
      ],
    );
  }

  // Future<void> updateCurrentLocation() async {
  //   await _locationService.location.then((location) => currentLocationStatus.add(toLocationStatus(location)));
  // }

  /// Process an updated location from device
  void _handleLocationUpdate(LocationStatus locationStatus) {
    print(locationStatus.toJson());

    /// If first point, initialize variables and return

    if (isFirstLocation) {
      isFirstLocation = false;
      return;
    }
    if (_prevLocation == null || _prevLocation!.timeStampSec == 0.0) {
      locationFilter = LocationFilter(locationStatus);
      _prevLocation = locationStatus;
      _prevHikeMetrics =
          getInitialMetrics(_prevLocation!, getCurrentTimeSeconds());
      _segmentPrevHikeMetrics =
          getInitialMetrics(_prevLocation!, getCurrentTimeSeconds());

      _currentPath.add(_prevLocation!);
      _segmentCurrentPath.add(_prevLocation!);

      _segmentCurrentTrip = TripSegment(
          hikeMetrics: _segmentPrevHikeMetrics,
          locationHistory: [_prevLocation!],
          unfilteredLocationHistory: [locationStatus]);

      _currentTrip = TripArchive(
        hikeMetrics: _prevHikeMetrics,
        tripSegments: [_segmentCurrentTrip!],
        tripName:
            "trip_${DateFormat('yyyy-MM-dd_kk-mm-ss').format(DateTime.now())}",
        // TODO: Add textbox
        locationHistory: [_prevLocation!],
        unfilteredLocationHistory: [locationStatus],
      );

      return;
    }

    _unfilteredPath.add(locationStatus);
    _segmentUnfilteredPath.add(locationStatus);

    // final filteredLocation = locationStatus;
    LocationStatus filteredLocation = locationFilter!.getValue(locationStatus);

    /// Check time elapsed, if less than updateIntervalSec then return
    // final double deltaSec = locationStatus.timeStampSec - _prevLocation.timeStampSec;
    final double deltaSec =
        filteredLocation.timeStampSec - _prevLocation!.timeStampSec;
    if (deltaSec < updateIntervalSec) return;

    // print('Updating location');
    // print(filteredLocation.toString());
    // currentLocationStatus.add(filteredLocation);

    final deltaDistance = SphericalUtil.computeDistanceBetween(
      LatLng(locationStatus.latitude, locationStatus.longitude),
      LatLng(_prevLocation!.latitude, _prevLocation!.longitude),
    ).toDouble();

    final totalDistance = SphericalUtil.computeDistanceBetween(
      LatLng(locationStatus.latitude, locationStatus.longitude),
      LatLng(_currentPath.first.latitude, _currentPath.first.longitude),
    ).toDouble();
    // print("DISTANCE: ${totalDistance*3.28/5280}");
    filteredLocation = filteredLocation.copyWith(
        speedMetersPerSec:
            totalDistance / (_prevHikeMetrics!.metricPeriodSeconds + deltaSec));

    currentLocationStatus.add(locationStatus);

    if (deltaDistance < filteredLocation.accuracy.value / 2) {
      // print("NOT MOVED ENOUGH");

      final HikeMetrics currMetrics = _prevHikeMetrics!.copyWith(
          metricPeriodSeconds:
              _prevHikeMetrics!.metricPeriodSeconds + deltaSec);
      final HikeMetrics currSegmentMetrics = _segmentPrevHikeMetrics!.copyWith(
          metricPeriodSeconds:
              _segmentPrevHikeMetrics!.metricPeriodSeconds + deltaSec);

      /// Save location update to current hike
      _currentPath.add(_prevLocation!);
      _segmentCurrentPath.add(_prevLocation!);

      /// Calculate hiker status update and publish value for UI
      _currentHikerMetricsSub.add(currMetrics);
      currentPathSub.add(_currentPath);
      currentRawPathSub.add(_unfilteredPath);
      currentSegmentPathSub.add(_segmentCurrentPath);
      currentSegmentRawPathSub.add(_segmentUnfilteredPath);
      elevationPlot.add(toElevationPlotValues(currMetrics));
      speedPlot.add(toSpeedPlotValues(currMetrics));

      _prevLocation =
          _prevLocation!.copyWith(timeStampSec: filteredLocation.timeStampSec);
      _prevHikeMetrics = currMetrics;
      _segmentPrevHikeMetrics = currSegmentMetrics;
    } else {
      final HikeMetrics currTotalMetrics = accumulateMetrics(
        prevMetrics: _prevHikeMetrics!,
        currLoc: filteredLocation,
        deltaDistance: deltaDistance,
        locationHistory: _currentPath,
        updatePeriodSec: deltaSec,
      ); // .copyWith(distanceTraveled: totalDistance);

      final HikeMetrics currSegmentMetrics = accumulateMetrics(
        prevMetrics: _segmentPrevHikeMetrics!,
        currLoc: filteredLocation,
        deltaDistance: deltaDistance,
        locationHistory: _segmentCurrentPath,
        updatePeriodSec: deltaSec,
      ); // .copyWith(distanceTraveled: totalDistance);

      /// Save location update to current hike
      _currentPath.add(filteredLocation);
      _segmentCurrentPath.add(filteredLocation);

      /// Calculate hiker status update and publish value for UI
      _currentHikerMetricsSub.add(currTotalMetrics);
      currentPathSub.add(_currentPath);
      currentRawPathSub.add(_unfilteredPath);
      currentSegmentPathSub.add(_segmentCurrentPath);
      currentSegmentRawPathSub.add(_segmentUnfilteredPath);
      elevationPlot.add(toElevationPlotValues(currTotalMetrics));
      speedPlot.add(toSpeedPlotValues(currTotalMetrics));

      _prevLocation = filteredLocation;
      _prevHikeMetrics = currTotalMetrics;
      _segmentPrevHikeMetrics = currTotalMetrics;
    }
  }

  PlotValues toElevationPlotValues(HikeMetrics metric) {
    List<List<double>> elevationValues = List.of(elevationPlotValues!.values);
    elevationValues
        .add([metric.metricPeriodSeconds, metric.altitude * 3.28084]);

    double elevRange = (metric.altitudeMax - metric.altitudeMin) * 3.28084;
    if (elevRange <= 10) {
      elevRange = 10;
    }

    return elevationPlotValues!.copyWith(
      values: elevationValues,
      xFormat: elevationPlotValues!.xFormat.copyWith(
        min: 0,
        max: metric.metricPeriodSeconds * 1.05,
        interval: metric.metricPeriodSeconds * 1.05 / 5,
      ),
      yFormat: elevationPlotValues!.yFormat.copyWith(
        min: metric.altitudeMin * 3.28084 - elevRange * .2,
        max: metric.altitudeMax * 3.28084 + elevRange * .2,
        interval: elevRange * 1.4 / 5,
      ),
    );
  }

  PlotValues toSpeedPlotValues(HikeMetrics metric) {
    final List<List<double>> speedValues = List.of(speedPlotValues!.values);
    speedValues.add([
      metric.metricPeriodSeconds,
      metric.speedMetersPerSec * MilesPerHourPerMetersPerSecond
    ]);

    double speedRangeMPH = metric.speedMax * MilesPerHourPerMetersPerSecond;
    if (speedRangeMPH <= .1) {
      speedRangeMPH = .1;
    }

    return speedPlotValues!.copyWith(
      values: speedValues,
      xFormat: speedPlotValues!.xFormat.copyWith(
        min: 0,
        max: metric.metricPeriodSeconds * 1.05,
        interval: metric.metricPeriodSeconds * 1.05 / 5,
      ),
      yFormat: speedPlotValues!.yFormat.copyWith(
        min: 0,
        max: speedRangeMPH * 1.2,
        interval: speedRangeMPH * 1.2 / 5,
      ),
    );
  }
}

/// Return initial hike metrics based on current location
HikeMetrics getInitialMetrics(LocationStatus curLoc, double currTimeSeconds) {
  return HikeMetrics(
    timeStartSec: currTimeSeconds,
    latitudeStart: curLoc.latitude,
    longitudeStart: curLoc.longitude,
    altitudeStart: curLoc.altitude,
    latitude: curLoc.latitude,
    longitude: curLoc.longitude,
    altitude: curLoc.altitude,
    speedMetersPerSec: curLoc.speedMetersPerSec,
    headingDegrees: curLoc.headingDegrees,
    locationAccuracy: curLoc.accuracy,
    speedAccuracy: curLoc.speedAccuracy,
    altitudeMax: curLoc.altitude,
    altitudeMin: curLoc.altitude,
    speedMax: curLoc.speedMetersPerSec,
    speedMin: curLoc.speedMetersPerSec,
    averageSpeedMetersPerSec: curLoc.speedMetersPerSec,
    netHeadingDegrees: curLoc.headingDegrees,
  );
}

/// Create LocationStatus object from Device location data
LocationStatus toLocationStatus(Location locationData) {
  return LocationStatus(
    latitude: locationData.latitude ?? 0.0,
    longitude: locationData.longitude ?? 0.0,
    accuracyValue: locationData.accuracy ?? 0.0,
    accuracy: toAccuracyType(locationData.accuracy ?? 0.0),
    altitude: locationData.altitude ?? 0.0,
    speedMetersPerSec: locationData.speed ?? 0.0,
    // speedAccuracyValue: locationData. ?? 0.0,
    // speedAccuracy: toAccuracyType(locationData.speedAccuracy ?? 0.0),
    headingDegrees: locationData.bearing ?? 0.0,
    timeStampSec: toSeconds(locationData.time ?? 0),
  );
}

/// Calculate hiker status update data
HikeMetrics accumulateMetrics({
  required HikeMetrics prevMetrics,
  required LocationStatus currLoc,
  required double deltaDistance,
  required List<LocationStatus> locationHistory,
  required double updatePeriodSec,
}) {
  // final speedMetersPerSec = deltaDistance / updatePeriodSec;

  final deltaAltitude = currLoc.altitude - prevMetrics.altitude;

  return prevMetrics.copyWith(
    latitude: currLoc.latitude,
    longitude: currLoc.longitude,
    altitude: currLoc.altitude,
    speedMetersPerSec: currLoc.speedMetersPerSec,
    headingDegrees: currLoc.headingDegrees,
    altitudeMax: max(prevMetrics.altitudeMax, currLoc.altitude),
    altitudeMin: min(prevMetrics.altitudeMin, currLoc.altitude),
    speedMax: max(prevMetrics.speedMax, currLoc.speedMetersPerSec),
    speedMin: min(prevMetrics.speedMin, currLoc.speedMetersPerSec),
    averageSpeedMetersPerSec: getAvgSpeed(
      prevMetrics.averageSpeedMetersPerSec,
      prevMetrics.metricPeriodSeconds,
      updatePeriodSec,
      currLoc.speedMetersPerSec,
    ),
    netHeadingDegrees: 1.0,
    // Heading
    distanceTraveled: prevMetrics.distanceTraveled + deltaDistance,
    netElevationChange: currLoc.altitude - prevMetrics.altitudeStart,
    cumulativeClimbMeters: deltaAltitude > 0
        ? prevMetrics.cumulativeClimbMeters + deltaAltitude
        : prevMetrics.cumulativeClimbMeters,
    cumulativeDescentMeters: deltaAltitude < 0
        ? prevMetrics.cumulativeDescentMeters - deltaAltitude
        : prevMetrics.cumulativeDescentMeters,
    metricPeriodSeconds: prevMetrics.metricPeriodSeconds + updatePeriodSec,
  );
  // _distanceTraveled += _distanceDelta.abs();
  // final hikerData = HikerStatus(
  //   latitude: _distanceTraveled.roundToDouble(),
  //   elevationChange: 0.0,
  //   timeElapsedSec: delta ~/ 1000, timeElapsed: (delta ~/ 1000).toString(),
  // );
}

/// Return the distance traveled between the previous hike status end point and the current location
double getAvgSpeed(
  double prevAvgSpeedMetersPerSec,
  double previousDurationSec,
  double updatePeriodSec,
  double currentSpeedMetersPerSec,
) {
  // print("prevAvg: $prevAvgSpeedMetersPerSec, prevPeriod: $previousDurationSec, currAvg: $currentSpeedMetersPerSec, currPeriod: $updatePeriodSec");
  return (prevAvgSpeedMetersPerSec * previousDurationSec +
          currentSpeedMetersPerSec * updatePeriodSec) /
      (previousDurationSec + updatePeriodSec);
}

/// Convert milliseconds since epoch value to seconds
double toSeconds(double timeStamp) => timeStamp / millisecondsPerSecond;

/// Return the current time in seconds since epoch.
double getCurrentTimeSeconds() =>
    DateTime.now().millisecondsSinceEpoch / millisecondsPerSecond;

/// Convert an accuracy value from Flutter location API to an enum
LocationAccuracyType toAccuracyType(double accuracy) {
  if (accuracy < 8) {
    return LocationAccuracyType.high;
  } else if (accuracy < 25) {
    return LocationAccuracyType.medium;
  } else {
    return LocationAccuracyType.low;
  }
}
