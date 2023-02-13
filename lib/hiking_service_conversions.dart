import 'package:hiking_app/models/hike_metrics.dart';
import 'package:kt_dart/collection.dart';

import 'models/location_accuracy_type.dart';
import 'models/units.dart';

class HikingServiceConversions {
  HikingServiceConversions();

  static const timeStartSecName = "timeStartSec";
  static const latitudeStartName = "latitudeStartName";
  static const longitudeStartName = "longitudeStartName";
  static const altitudeStartName = "altitudeStartName";
  static const latitudeName = "latitude";
  static const longitudeName = "longitude";
  static const altitudeName = "altitude";
  static const speedMetersPerSecName = "speed";
  static const headingDegreesName = "heading";
  static const locationAccuracyName = "accuracy";
  static const speedAccuracyName = "speed accuracy";
  static const altitudeMaxName = "max elevation";
  static const altitudeMinName = "min elevation";
  static const speedMaxName = "max speed";
  static const speedMinName = "min speed";
  static const averageSpeedMetersPerSecName = "average speed";
  static const netHeadingDegreesName = "net heading";
  static const distanceTraveledName = "distance traveled";
  static const netElevationChangeName = "net elevation change";
  static const cumulativeClimbMetersName = "cumulative ascent";
  static const cumulativeDescentMetersName = "cumulative descent";
  static const metricPeriodSecondsName = "time elapsed";

  HikeMetricsData? metricsToData(
          HikeMetrics hikeMetrics, KtMap<String, Unit> units) =>
      HikeMetricsData(
        timeStartSec: Metric(
            name: timeStartSecName,
            value: hikeMetrics.timeStartSec.toString(),
            visible: false),
        latitudeStart: Metric(
            name: latitudeStartName,
            value: hikeMetrics.latitudeStart.toString(),
            visible: false),
        longitudeStart: Metric(
            name: longitudeStartName,
            value: hikeMetrics.longitudeStart.toString(),
            visible: false),
        altitudeStart: Metric(
            name: altitudeStartName,
            value: hikeMetrics.altitudeStart.toString(),
            visible: false,
            unitType: UnitType.distance),
        latitude: Metric(
            name: latitudeName,
            value: _toCurrentLatitude(
              hikeMetrics.latitude,
            )),
        longitude: Metric(
            name: longitudeName,
            value: _toCurrentLongitude(hikeMetrics.longitude)),
        altitude: Metric(
            name: altitudeName,
            value: _toCurrentAltitude(hikeMetrics.altitude,
                unit: units.getOrDefault(altitudeName, UnspecifiedUnits.unit)),
            unitType: UnitType.distance),
        speedMetersPerSec: Metric(
            name: speedMetersPerSecName,
            value: _toSpeedMetersPerSec(hikeMetrics.speedMetersPerSec,
                unit: units.getOrDefault(
                    speedMetersPerSecName, UnspecifiedUnits.unit)),
            unitType: UnitType.speed),
        headingDegrees: Metric(
            name: headingDegreesName,
            value: hikeMetrics.headingDegrees.toString(),
            visible: false),
        locationAccuracy: Metric(
            name: locationAccuracyName,
            value: _toCurrentAccuracy(hikeMetrics.locationAccuracy,
                unit: units.getOrDefault(
                    locationAccuracyName, UnspecifiedUnits.unit))),
        speedAccuracy: Metric(
            name: speedAccuracyName,
            value: hikeMetrics.speedAccuracy.toString(),
            visible: false),
        altitudeMax: Metric(
            name: altitudeMaxName,
            value: _toAltitudeMax(hikeMetrics.altitudeMax,
                unit:
                    units.getOrDefault(altitudeMaxName, UnspecifiedUnits.unit)),
            unitType: UnitType.distance),
        altitudeMin: Metric(
            name: altitudeMinName,
            value: _toAltitudeMin(hikeMetrics.altitudeMin,
                unit:
                    units.getOrDefault(altitudeMinName, UnspecifiedUnits.unit)),
            unitType: UnitType.distance),
        speedMax: Metric(
            name: speedMaxName,
            value: _toSpeedMax(hikeMetrics.speedMax,
                unit: units.getOrDefault(speedMaxName, UnspecifiedUnits.unit)),
            unitType: UnitType.speed),
        speedMin: Metric(
            name: speedMinName,
            value: hikeMetrics.speedMin.toString(),
            visible: false,
            unitType: UnitType.speed),
        averageSpeedMetersPerSec: Metric(
            name: averageSpeedMetersPerSecName,
            value: _toAverageSpeedMetersPerSec(
                hikeMetrics.averageSpeedMetersPerSec,
                unit: units.getOrDefault(
                    averageSpeedMetersPerSecName, UnspecifiedUnits.unit)),
            unitType: UnitType.speed),
        netHeadingDegrees: Metric(
            name: netHeadingDegreesName,
            value: _toNetHeading(hikeMetrics.netHeadingDegrees,
                unit: units.getOrDefault(
                    netHeadingDegreesName, UnspecifiedUnits.unit)),
            visible: false),
        distanceTraveled: Metric(
            name: distanceTraveledName,
            value: _toDistanceTraveledString(hikeMetrics.distanceTraveled,
                unit: units.getOrDefault(
                    distanceTraveledName, UnspecifiedUnits.unit)),
            unitType: UnitType.distance),
        netElevationChange: Metric(
            name: netElevationChangeName,
            value: _toElevationChangeString(hikeMetrics.netElevationChange,
                unit: units.getOrDefault(
                    netElevationChangeName, UnspecifiedUnits.unit)),
            unitType: UnitType.distance),
        cumulativeClimbMeters: Metric(
            name: cumulativeClimbMetersName,
            value: _toCumulativeClimbMeters(hikeMetrics.cumulativeClimbMeters,
                unit: units.getOrDefault(
                    cumulativeClimbMetersName, UnspecifiedUnits.unit)),
            visible: false,
            unitType: UnitType.distance),
        cumulativeDescentMeters: Metric(
            name: cumulativeDescentMetersName,
            value: _toCumulativeDescentMeters(
                hikeMetrics.cumulativeDescentMeters,
                unit: units.getOrDefault(
                    cumulativeDescentMetersName, UnspecifiedUnits.unit)),
            visible: false,
            unitType: UnitType.distance),
        metricPeriodSeconds: Metric(
          name: metricPeriodSecondsName,
          value: _toTimeElapsedString(hikeMetrics.metricPeriodSeconds,
              unit: units.getOrDefault(
                  metricPeriodSecondsName, UnspecifiedUnits.unit)),
        ),
      );

  String _toDistanceTraveledString(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    final miles = metersToFeet(val) / feetPerMile;
    return "${miles.toStringAsFixed(2)} mi";
  }

  String _toElevationChangeString(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }

    final feet = metersToFeet(val).round();
    return "$feet ft";
  }

  String _toTimeElapsedString(double val, {Unit? unit}) {
    final int minutes = (val / secPerMin).round() % minPerHour;
    final int hours = ((val / secPerMin) / minPerHour).floor();
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }

  String _toCurrentLatitude(double val, {Unit? unit}) {
    return val.toStringAsFixed(7);
  }

  String _toCurrentLongitude(double val, {Unit? unit}) {
    return val.toStringAsFixed(7);
  }

  String _toCurrentAltitude(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }

    return "${metersToFeet(val).round()} ft";
  }

  String _toCurrentAccuracy(LocationAccuracyType val, {Unit? unit}) {
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

  String _toSpeedMetersPerSec(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    double speed = 0;
    speed = val * 2.23694;
    return "${speed.toStringAsFixed(1)} mph";
    // if (val > 0.05, {Unit? unit}) {
    //   speed = (1 / (val * metersPerSecToMilesPerMin)).round();
    // }
    // return "$speed min/mile";
  }

  String _toCumulativeClimbMeters(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    final metric = val.round();
    return "$metric ft";
  }

  String _toCumulativeDescentMeters(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    final metric = val.round();
    return "$metric ft";
  }

  String _toAverageSpeedMetersPerSec(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    double speed = val * 2.23694;
    return "${speed.toStringAsFixed(1)} mph";
    if (val > 0.01) {
      speed = (1 / (val * metersPerSecToMilesPerMin));
    }
    return "${speed.toStringAsFixed(1)} min/mile";
  }

  String _toSpeedMax(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    double speed = val * 2.23694;
    return "${speed.toStringAsFixed(1)} mph";
    if (val > 0.05) {
      speed = (1 / (val * metersPerSecToMilesPerMin));
    }
    return "$speed min/mile";
  }

  String _toAltitudeMin(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    final altMin = metersToFeet(val).round();
    return "$altMin ft";
  }

  String _toAltitudeMax(double val, {Unit? unit}) {
    if (unit != null) {
      return "${unit.fromDefault(val).toStringAsFixed(2)} ${unit.name}";
    }
    final altMax = metersToFeet(val).round();
    return "$altMax ft";
  }

  String _toNetHeading(double val, {Unit? unit}) {
    final heading = val.round();
    return "$heading deg";
  }
}
