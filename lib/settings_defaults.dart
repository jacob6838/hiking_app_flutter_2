import 'package:hiking_app/hiking_service_conversions.dart';
import 'package:kt_dart/collection.dart';

import 'models/units.dart';

class SettingsDefaults {
  static Unit elevationUnit = DistanceUnits.ft;
  static Unit distanceUnit = DistanceUnits.mile;
  static Unit speedUnit = SpeedUnits.mph;

  static KtMap<String, Unit> units = {
    HikingServiceConversions.timeStartSecName: UnspecifiedUnits.unit,
    HikingServiceConversions.latitudeStartName: UnspecifiedUnits.unit,
    HikingServiceConversions.longitudeStartName: UnspecifiedUnits.unit,
    HikingServiceConversions.altitudeStartName: elevationUnit,
    HikingServiceConversions.latitudeName: UnspecifiedUnits.unit,
    HikingServiceConversions.longitudeName: UnspecifiedUnits.unit,
    HikingServiceConversions.altitudeName: elevationUnit,
    HikingServiceConversions.speedMetersPerSecName: speedUnit,
    HikingServiceConversions.headingDegreesName: UnspecifiedUnits.unit,
    HikingServiceConversions.locationAccuracyName: distanceUnit,
    HikingServiceConversions.speedAccuracyName: speedUnit,
    HikingServiceConversions.altitudeMaxName: elevationUnit,
    HikingServiceConversions.altitudeMinName: elevationUnit,
    HikingServiceConversions.speedMaxName: elevationUnit,
    HikingServiceConversions.speedMinName: elevationUnit,
    HikingServiceConversions.averageSpeedMetersPerSecName: speedUnit,
    HikingServiceConversions.netHeadingDegreesName: UnspecifiedUnits.unit,
    HikingServiceConversions.distanceTraveledName: distanceUnit,
    HikingServiceConversions.netElevationChangeName: elevationUnit,
    HikingServiceConversions.cumulativeClimbMetersName: elevationUnit,
    HikingServiceConversions.cumulativeDescentMetersName: elevationUnit,
    HikingServiceConversions.metricPeriodSecondsName: UnspecifiedUnits.unit,
  }.toImmutableMap();
}
