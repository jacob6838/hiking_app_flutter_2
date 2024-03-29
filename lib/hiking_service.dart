import 'dart:math';

import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:hiking_app/location_service.dart';
import 'package:hiking_app/models/data_archive.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:hiking_app/models/location_accuracy_type.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:rxdart/rxdart.dart';

import 'archive_service.dart';
import 'filters/location_filter.dart';
import 'models/plot_values.dart';

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
  bool _hikeIsActive = false;
  HikeMetrics _hikeMetricsTotal = const HikeMetrics();
  double _lastUpdateTimeSec = 0.0;
  PlotValues? elevationPlotValues;
  PlotValues? speedPlotValues;
  ArchiveService archiveService = ArchiveService();

  /// List of all points for the current hike
  final List<LocationStatus> _currentPath = [];
  final List<LocationStatus> _unfilteredPath = [];

  int? reportPeriodSec;

  LocationFilter? locationFilter;

  /// Previous position used to determine when a location change is sufficiently large to warrant a hiker status update.
  LocationStatus? _prevLocation;
  HikeMetrics? _prevHikeMetrics;

  final BehaviorSubject<bool> _activeStatusSub = BehaviorSubject.seeded(false);
  final BehaviorSubject<LocationStatus> _currentLocationStatusSub =
      BehaviorSubject.seeded(const LocationStatus());
  final BehaviorSubject<HikeMetrics> _currentHikerMetricsSub =
      BehaviorSubject.seeded(const HikeMetrics());
  final BehaviorSubject<List<LocationStatus>> currentPathSub =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<LocationStatus>> currentRawPathSub =
      BehaviorSubject.seeded([]);

  HikingService({required LocationService locationService})
      : _lastUpdateTimeSec = 0,
        _locationService = locationService {
    _locationService.locationStream
        .where((_) => _hikeIsActive)
        .map(toLocationStatus)
        .listen(_handleLocationUpdate);
    archiveService.activeDataArchive.listen(_handleArchiveChange);
  }

  final BehaviorSubject<PlotValues> elevationPlot =
      BehaviorSubject<PlotValues>();
  final BehaviorSubject<PlotValues> speedPlot = BehaviorSubject<PlotValues>();

  Stream<bool> get currentHikerStatus$ =>
      _activeStatusSub.stream.asBroadcastStream();

  BehaviorSubject<LocationStatus> get currentLocationStatus =>
      BehaviorSubject<LocationStatus>();

  Stream<HikeMetrics> get currentHikerMetrics$ =>
      _currentHikerMetricsSub.stream.asBroadcastStream();

  Future<String?> toggleStatus(BuildContext context,
      HikingService hikingService, String tripName) async {
    if (!_hikeIsActive) {
      if (!await hikingService._locationService.locationAlwaysGranted()) {
        await showDialog(
          context: context,
          builder: (BuildContext context) => locationDisclosurePopup(context),
        );
      }

      final locationAlwaysEnabled =
          await hikingService._locationService.requestEnableLocationAlways();
      final gpsEnabled =
          await hikingService._locationService.requestEnableGps();
      if (gpsEnabled && locationAlwaysEnabled) {
        _hikeIsActive = !_hikeIsActive;
        _activeStatusSub.add(_hikeIsActive);
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
      _hikeIsActive = !_hikeIsActive;
      _activeStatusSub.add(_hikeIsActive);
    }

    if (_hikeIsActive) {
      hikingService._locationService.startLocationUpdates();
      // _prevLocation = toLocationStatus(await _locationService.location);
      _prevLocation = const LocationStatus();
      // _hikeMetricsTotal = getInitialMetrics(_prevLocation, getCurrentTimeSeconds());
      _currentPath.clear();
      _unfilteredPath.clear();
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
    } else {
      hikingService._locationService.stopLocationService();
      return archiveCurrentTripData(tripName);
    }
    return null;
  }

  void _handleArchiveChange(DataArchive dataArchive) async {
    _currentHikerMetricsSub.value =
        dataArchive.hikeMetrics ?? const HikeMetrics();
    currentPathSub.value = dataArchive.locationHistory ?? [];
    currentRawPathSub.value = dataArchive.unfilteredLocationHistory ?? [];
    elevationPlot.value = dataArchive.elevationPlot ?? PlotValues();
    speedPlot.value = dataArchive.speedPlot ?? PlotValues();
  }

  Future<String> archiveCurrentTripData(String tripName) async {
    final dataArchive = DataArchive(
        hikeMetrics: _currentHikerMetricsSub.value,
        locationHistory: currentPathSub.value,
        unfilteredLocationHistory: currentRawPathSub.value,
        elevationPlot: elevationPlot.value,
        speedPlot: speedPlot.value);
    await archiveService.createArchive(tripName, dataArchive);
    return tripName;
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

  /// Process an updated location from device
  void _handleLocationUpdate(LocationStatus locationStatus) {
    /// If first point, initialize variables and return
    if (_prevLocation == null || _prevLocation!.timeStampSec == 0.0) {
      locationFilter = LocationFilter(locationStatus);
      _prevLocation = locationStatus;
      _hikeMetricsTotal =
          getInitialMetrics(_prevLocation!, getCurrentTimeSeconds());
      _prevHikeMetrics = _hikeMetricsTotal;

      _currentPath.add(_prevLocation!);

      _currentHikerMetricsSub.add(_hikeMetricsTotal);
      currentPathSub.add(_currentPath);
      _unfilteredPath.add(locationStatus);
      return;
    }

    _unfilteredPath.add(locationStatus);

    // final filteredLocation = locationStatus;
    LocationStatus filteredLocation = locationFilter!.getValue(locationStatus);

    /// Check time elapsed, if less than updateIntervalSec then return
    // final double deltaSec = locationStatus.timeStampSec - _prevLocation.timeStampSec;
    final double deltaSec =
        filteredLocation.timeStampSec - _prevLocation!.timeStampSec;
    if (deltaSec < updateIntervalSec) return;

    final deltaDistance = SphericalUtil.computeDistanceBetween(
      LatLng(locationStatus.latitude, locationStatus.longitude),
      LatLng(_prevLocation!.latitude, _prevLocation!.longitude),
    ).toDouble();

    final totalDistance = SphericalUtil.computeDistanceBetween(
      LatLng(locationStatus.latitude, locationStatus.longitude),
      LatLng(_currentPath.first.latitude, _currentPath.first.longitude),
    ).toDouble();
    filteredLocation = filteredLocation.copyWith(
        speedMetersPerSec:
            totalDistance / (_prevHikeMetrics!.metricPeriodSeconds + deltaSec));

    currentLocationStatus.add(locationStatus);

    if (deltaDistance < filteredLocation.accuracy.value / 2) {
      // NOT MOVED ENOUGH\
      filteredLocation = _prevLocation!;
    }

    // final HikeMetrics currMetrics = _prevHikeMetrics!.copyWith(
    //     metricPeriodSeconds:
    //         _prevHikeMetrics!.metricPeriodSeconds + deltaSec);

    // /// Save location update to current hike
    // _currentPath.add(_prevLocation!);

    // /// Calculate hiker status update and publish value for UI
    // _currentHikerMetricsSub.add(currMetrics);
    // currentPathSub.add(_currentPath);
    // currentRawPathSub.add(_unfilteredPath);
    // elevationPlot.add(toElevationPlotValues(currMetrics));
    // speedPlot.add(toSpeedPlotValues(currMetrics));

    // _prevLocation =
    //     _prevLocation!.copyWith(timeStampSec: filteredLocation.timeStampSec);
    // _prevHikeMetrics = currMetrics;
    // } else {
    // print("YES MOVED ENOUGH");

    final HikeMetrics currMetrics = accumulateMetrics(
      prevMetrics: _prevHikeMetrics!,
      currLoc: filteredLocation,
      deltaDistance: deltaDistance,
      locationHistory: _currentPath,
      updatePeriodSec: deltaSec,
    ); // .copyWith(distanceTraveled: totalDistance);

    /// Save location update to current hike
    _currentPath.add(filteredLocation);

    /// Calculate hiker status update and publish value for UI
    _currentHikerMetricsSub.add(currMetrics);
    currentPathSub.add(_currentPath);
    currentRawPathSub.add(_unfilteredPath);
    elevationPlot.add(toElevationPlotValues(currMetrics));
    speedPlot.add(toSpeedPlotValues(currMetrics));

    _prevLocation = filteredLocation;
    _prevHikeMetrics = currMetrics;
    // }
  }

  PlotValues toElevationPlotValues(HikeMetrics metric) {
    List<List<double>> elevationValues = List.of(elevationPlotValues!.values);
    elevationValues
        .add([metric.metricPeriodSeconds, metric.altitude * 3.28084]);
    elevationPlotValues =
        elevationPlotValues?.copyWith(values: elevationValues);

    double elevRange = (metric.altitudeMax - metric.altitudeMin) * 3.28084;
    if (elevRange <= 10) {
      elevRange = 10;
    }
    double minElev = metric.altitudeMin * 3.28084 - elevRange * .2;
    double maxElev = metric.altitudeMax * 3.28084 + elevRange * .2;

    return elevationPlotValues!.copyWith(
      xFormat: elevationPlotValues!.xFormat.copyWith(
        min: 0,
        max: metric.metricPeriodSeconds * 1.05,
        interval: metric.metricPeriodSeconds * 1.05 / 2,
      ),
      yFormat: elevationPlotValues!.yFormat.copyWith(
        min: minElev,
        max: maxElev,
        interval: (maxElev - minElev) / 2,
      ),
    );
  }

  PlotValues toSpeedPlotValues(HikeMetrics metric) {
    final List<List<double>> speedValues = List.of(speedPlotValues!.values);
    speedValues.add([
      metric.metricPeriodSeconds,
      metric.speedMetersPerSec * MilesPerHourPerMetersPerSecond
    ]);
    speedPlotValues = speedPlotValues?.copyWith(values: speedValues);

    double speedRangeMPH = metric.speedMax * MilesPerHourPerMetersPerSecond;
    if (speedRangeMPH <= .1) {
      speedRangeMPH = .1;
    }

    return speedPlotValues!.copyWith(
      xFormat: speedPlotValues!.xFormat.copyWith(
        min: 0,
        max: metric.metricPeriodSeconds * 1.05,
        interval: metric.metricPeriodSeconds * 1.05 / 2,
      ),
      yFormat: speedPlotValues!.yFormat.copyWith(
        min: 0,
        max: speedRangeMPH * 1.2,
        interval: speedRangeMPH * 1.2 / 2,
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
  final totalDistance = prevMetrics.distanceTraveled + deltaDistance;
  final metricPeriodSeconds = prevMetrics.metricPeriodSeconds + updatePeriodSec;

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
    averageSpeedMetersPerSec: totalDistance / metricPeriodSeconds,
    netHeadingDegrees: 1.0,
    // Heading
    distanceTraveled: totalDistance,
    netElevationChange: currLoc.altitude - prevMetrics.altitudeStart,
    cumulativeClimbMeters: deltaAltitude > 0
        ? prevMetrics.cumulativeClimbMeters + deltaAltitude
        : prevMetrics.cumulativeClimbMeters,
    cumulativeDescentMeters: deltaAltitude < 0
        ? prevMetrics.cumulativeDescentMeters - deltaAltitude
        : prevMetrics.cumulativeDescentMeters,
    metricPeriodSeconds: metricPeriodSeconds,
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
