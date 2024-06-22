import 'package:hiking_app/models/hike_metrics.dart';

import 'models/location_accuracy_type.dart';

class HikingServiceConversions {
  HikingServiceConversions();

  static const _timeStartSecName = "timeStartSec";
  static const _latitudeStartName = "latitudeStartName";
  static const _longitudeStartName = "longitudeStartName";
  static const _altitudeStartName = "altitudeStartName";
  static const _latitudeName = "latitude";
  static const _longitudeName = "longitude";
  static const _altitudeName = "altitude";
  static const _speedMetersPerSecName = "speed";
  static const _headingDegreesName = "heading";
  static const _locationAccuracyName = "accuracy";
  static const _speedAccuracyName = "speed accuracy";
  static const _altitudeMaxName = "max elevation";
  static const _altitudeMinName = "min elevation";
  static const _speedMaxName = "max speed";
  static const _speedMinName = "min speed";
  static const _averageSpeedMetersPerSecName = "average speed";
  static const _netHeadingDegreesName = "net heading";
  static const _distanceTraveledName = "distance traveled";
  static const _netElevationChangeName = "net elevation change";
  static const _cumulativeClimbMetersName = "cumulative ascent";
  static const _cumulativeDescentMetersName = "cumulative descent";
  static const _metricPeriodSecondsName = "time elapsed";

  static HikeMetricsData metricsToData(HikeMetrics hikeMetrics) =>
      HikeMetricsData(
        timeStartSec: Metric(
            name: _timeStartSecName,
            value: hikeMetrics.timeStartSec.toString(),
            visible: false),
        latitudeStart: Metric(
            name: _latitudeStartName,
            value: hikeMetrics.latitudeStart.toString(),
            visible: false),
        longitudeStart: Metric(
            name: _longitudeStartName,
            value: hikeMetrics.longitudeStart.toString(),
            visible: false),
        altitudeStart: Metric(
            name: _altitudeStartName,
            value: hikeMetrics.altitudeStart.toString(),
            visible: false),
        latitude: Metric(
            name: _latitudeName,
            value: _toCurrentLatitude(hikeMetrics.latitude)),
        longitude: Metric(
            name: _longitudeName,
            value: _toCurrentLongitude(hikeMetrics.longitude)),
        altitude: Metric(
            name: _altitudeName,
            value: _toCurrentAltitude(hikeMetrics.altitude)),
        speedMetersPerSec: Metric(
            name: _speedMetersPerSecName,
            value: _toSpeedMetersPerSec(hikeMetrics.speedMetersPerSec)),
        headingDegrees: Metric(
            name: _headingDegreesName,
            value: hikeMetrics.headingDegrees.toString(),
            visible: false),
        locationAccuracy: Metric(
            name: _locationAccuracyName,
            value: _toCurrentAccuracy(hikeMetrics.locationAccuracy)),
        speedAccuracy: Metric(
            name: _speedAccuracyName,
            value: hikeMetrics.speedAccuracy.toString(),
            visible: false),
        altitudeMax: Metric(
            name: _altitudeMaxName,
            value: _toAltitudeMax(hikeMetrics.altitudeMax)),
        altitudeMin: Metric(
            name: _altitudeMinName,
            value: _toAltitudeMin(hikeMetrics.altitudeMin)),
        speedMax: Metric(
            name: _speedMaxName, value: _toSpeedMax(hikeMetrics.speedMax)),
        speedMin: Metric(
            name: _speedMinName,
            value: hikeMetrics.speedMin.toString(),
            visible: false),
        averageSpeedMetersPerSec: Metric(
            name: _averageSpeedMetersPerSecName,
            value: _toAverageSpeedMetersPerSec(
                hikeMetrics.averageSpeedMetersPerSec)),
        netHeadingDegrees: Metric(
            name: _netHeadingDegreesName,
            value: _toNetHeading(hikeMetrics.netHeadingDegrees),
            visible: false),
        distanceTraveled: Metric(
            name: _distanceTraveledName,
            value: _toDistanceTraveledString(hikeMetrics.distanceTraveled)),
        netElevationChange: Metric(
            name: _netElevationChangeName,
            value: _toElevationChangeString(hikeMetrics.netElevationChange)),
        cumulativeClimbMeters: Metric(
            name: _cumulativeClimbMetersName,
            value: _toCumulativeClimbMeters(hikeMetrics.cumulativeClimbMeters),
            visible: false),
        cumulativeDescentMeters: Metric(
            name: _cumulativeDescentMetersName,
            value:
                _toCumulativeDescentMeters(hikeMetrics.cumulativeDescentMeters),
            visible: false),
        metricPeriodSeconds: Metric(
            name: _metricPeriodSecondsName,
            value: _toTimeElapsedString(hikeMetrics.metricPeriodSeconds)),
      );

  static String _toDistanceTraveledString(double val) {
    final miles = metersToFeet(val) / feetPerMile;
    return "${miles.toStringAsFixed(2)} mi";
  }

  static String _toElevationChangeString(double val) {
    final feet = metersToFeet(val).round();
    return "$feet ft";
  }

  static String _toTimeElapsedString(double val) {
    final int minutes = (val / secPerMin).round() % minPerHour;
    final int hours = ((val / secPerMin) / minPerHour).floor();
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }

  static String _toCurrentLatitude(double val) => val.toStringAsFixed(7);
  static String _toCurrentLongitude(double val) => val.toStringAsFixed(7);
  static String _toCurrentAltitude(double val) =>
      "${metersToFeet(val).round()} ft";

  static String _toCurrentAccuracy(LocationAccuracyType val) {
    String accuracy = "unknown";
    if (val == LocationAccuracyType.low) {
      accuracy = "low (> 25m)";
    } else if (val == LocationAccuracyType.medium) {
      accuracy = "medium (> 8m)";
    } else {
      accuracy = "high (< 8m)";
    }
    return accuracy;
  }

  static String _toSpeedMetersPerSec(double val) {
    double speed = 0;
    speed = val * 2.23694;
    return "${speed.toStringAsFixed(1)} mph";
    // if (val > 0.05) {
    //   speed = (1 / (val * metersPerSecToMilesPerMin)).round();
    // }
    // return "$speed min/mile";
  }

  static String _toCumulativeClimbMeters(double val) {
    final metric = val.round();
    return "$metric ft";
  }

  static String _toCumulativeDescentMeters(double val) {
    final metric = val.round();
    return "$metric ft";
  }

  static String _toAverageSpeedMetersPerSec(double val) {
    if (val == null) return "stuff";
    int speed = 0;
    speed = (val * 2.23694).round();
    return "$speed mph";
    if (val > 0.01) {
      speed = (1 / (val * metersPerSecToMilesPerMin)).round();
    }
    return "$speed min/mile";
  }

  static String _toSpeedMax(double val) {
    int speed = 0;
    speed = (val * 2.23694).round();
    return "$speed mph";
    if (val > 0.05) {
      speed = (1 / (val * metersPerSecToMilesPerMin)).round();
    }
    return "$speed min/mile";
  }

  static String _toAltitudeMin(double val) {
    final altMin = metersToFeet(val).round();
    return "$altMin ft";
  }

  static String _toAltitudeMax(double val) {
    final altMax = metersToFeet(val).round();
    return "$altMax ft";
  }

  static String _toNetHeading(double val) {
    final heading = val.round();
    return "$heading deg";
  }
}

const double feetPerMeter = 3.28084;
const double metersPerSecToMilesPerMin = 0.0372823;
const feetPerMile = 5280;

const int minPerHour = 60;
const int secPerMin = 60;

double metersToFeet(double distance) {
  return distance * feetPerMeter;
}
