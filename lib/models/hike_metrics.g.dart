// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HikeMetricsImpl _$$HikeMetricsImplFromJson(Map<String, dynamic> json) =>
    _$HikeMetricsImpl(
      timeStartSec: (json['timeStartSec'] as num?)?.toDouble() ?? 0.0,
      latitudeStart: (json['latitudeStart'] as num?)?.toDouble() ?? 0.0,
      longitudeStart: (json['longitudeStart'] as num?)?.toDouble() ?? 0.0,
      altitudeStart: (json['altitudeStart'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0.0,
      speedMetersPerSec: (json['speedMetersPerSec'] as num?)?.toDouble() ?? 0.0,
      headingDegrees: (json['headingDegrees'] as num?)?.toDouble() ?? 0.0,
      locationAccuracy: $enumDecodeNullable(
              _$LocationAccuracyTypeEnumMap, json['locationAccuracy']) ??
          LocationAccuracyType.low,
      speedAccuracy: $enumDecodeNullable(
              _$LocationAccuracyTypeEnumMap, json['speedAccuracy']) ??
          LocationAccuracyType.low,
      altitudeMax: (json['altitudeMax'] as num?)?.toDouble() ?? 0.0,
      altitudeMin: (json['altitudeMin'] as num?)?.toDouble() ?? 0.0,
      speedMax: (json['speedMax'] as num?)?.toDouble() ?? 0.0,
      speedMin: (json['speedMin'] as num?)?.toDouble() ?? 0.0,
      averageSpeedMetersPerSec:
          (json['averageSpeedMetersPerSec'] as num?)?.toDouble() ?? 0.0,
      netHeadingDegrees: (json['netHeadingDegrees'] as num?)?.toDouble() ?? 0.0,
      distanceTraveled: (json['distanceTraveled'] as num?)?.toDouble() ?? 0.0,
      netElevationChange:
          (json['netElevationChange'] as num?)?.toDouble() ?? 0.0,
      cumulativeClimbMeters:
          (json['cumulativeClimbMeters'] as num?)?.toDouble() ?? 0.0,
      cumulativeDescentMeters:
          (json['cumulativeDescentMeters'] as num?)?.toDouble() ?? 0.0,
      metricPeriodSeconds:
          (json['metricPeriodSeconds'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$HikeMetricsImplToJson(_$HikeMetricsImpl instance) =>
    <String, dynamic>{
      'timeStartSec': instance.timeStartSec,
      'latitudeStart': instance.latitudeStart,
      'longitudeStart': instance.longitudeStart,
      'altitudeStart': instance.altitudeStart,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speedMetersPerSec': instance.speedMetersPerSec,
      'headingDegrees': instance.headingDegrees,
      'locationAccuracy':
          _$LocationAccuracyTypeEnumMap[instance.locationAccuracy]!,
      'speedAccuracy': _$LocationAccuracyTypeEnumMap[instance.speedAccuracy]!,
      'altitudeMax': instance.altitudeMax,
      'altitudeMin': instance.altitudeMin,
      'speedMax': instance.speedMax,
      'speedMin': instance.speedMin,
      'averageSpeedMetersPerSec': instance.averageSpeedMetersPerSec,
      'netHeadingDegrees': instance.netHeadingDegrees,
      'distanceTraveled': instance.distanceTraveled,
      'netElevationChange': instance.netElevationChange,
      'cumulativeClimbMeters': instance.cumulativeClimbMeters,
      'cumulativeDescentMeters': instance.cumulativeDescentMeters,
      'metricPeriodSeconds': instance.metricPeriodSeconds,
    };

const _$LocationAccuracyTypeEnumMap = {
  LocationAccuracyType.high: 'high',
  LocationAccuracyType.medium: 'medium',
  LocationAccuracyType.low: 'low',
};

_$HikeMetricsDataImpl _$$HikeMetricsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HikeMetricsDataImpl(
      timeStartSec: json['timeStartSec'] == null
          ? null
          : Metric.fromJson(json['timeStartSec'] as Map<String, dynamic>),
      latitudeStart: json['latitudeStart'] == null
          ? null
          : Metric.fromJson(json['latitudeStart'] as Map<String, dynamic>),
      longitudeStart: json['longitudeStart'] == null
          ? null
          : Metric.fromJson(json['longitudeStart'] as Map<String, dynamic>),
      altitudeStart: json['altitudeStart'] == null
          ? null
          : Metric.fromJson(json['altitudeStart'] as Map<String, dynamic>),
      latitude: json['latitude'] == null
          ? null
          : Metric.fromJson(json['latitude'] as Map<String, dynamic>),
      longitude: json['longitude'] == null
          ? null
          : Metric.fromJson(json['longitude'] as Map<String, dynamic>),
      altitude: json['altitude'] == null
          ? null
          : Metric.fromJson(json['altitude'] as Map<String, dynamic>),
      speedMetersPerSec: json['speedMetersPerSec'] == null
          ? null
          : Metric.fromJson(json['speedMetersPerSec'] as Map<String, dynamic>),
      headingDegrees: json['headingDegrees'] == null
          ? null
          : Metric.fromJson(json['headingDegrees'] as Map<String, dynamic>),
      locationAccuracy: json['locationAccuracy'] == null
          ? null
          : Metric.fromJson(json['locationAccuracy'] as Map<String, dynamic>),
      speedAccuracy: json['speedAccuracy'] == null
          ? null
          : Metric.fromJson(json['speedAccuracy'] as Map<String, dynamic>),
      altitudeMax: json['altitudeMax'] == null
          ? null
          : Metric.fromJson(json['altitudeMax'] as Map<String, dynamic>),
      altitudeMin: json['altitudeMin'] == null
          ? null
          : Metric.fromJson(json['altitudeMin'] as Map<String, dynamic>),
      speedMax: json['speedMax'] == null
          ? null
          : Metric.fromJson(json['speedMax'] as Map<String, dynamic>),
      speedMin: json['speedMin'] == null
          ? null
          : Metric.fromJson(json['speedMin'] as Map<String, dynamic>),
      averageSpeedMetersPerSec: json['averageSpeedMetersPerSec'] == null
          ? null
          : Metric.fromJson(
              json['averageSpeedMetersPerSec'] as Map<String, dynamic>),
      netHeadingDegrees: json['netHeadingDegrees'] == null
          ? null
          : Metric.fromJson(json['netHeadingDegrees'] as Map<String, dynamic>),
      distanceTraveled: json['distanceTraveled'] == null
          ? null
          : Metric.fromJson(json['distanceTraveled'] as Map<String, dynamic>),
      netElevationChange: json['netElevationChange'] == null
          ? null
          : Metric.fromJson(json['netElevationChange'] as Map<String, dynamic>),
      cumulativeClimbMeters: json['cumulativeClimbMeters'] == null
          ? null
          : Metric.fromJson(
              json['cumulativeClimbMeters'] as Map<String, dynamic>),
      cumulativeDescentMeters: json['cumulativeDescentMeters'] == null
          ? null
          : Metric.fromJson(
              json['cumulativeDescentMeters'] as Map<String, dynamic>),
      metricPeriodSeconds: json['metricPeriodSeconds'] == null
          ? null
          : Metric.fromJson(
              json['metricPeriodSeconds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HikeMetricsDataImplToJson(
        _$HikeMetricsDataImpl instance) =>
    <String, dynamic>{
      'timeStartSec': instance.timeStartSec,
      'latitudeStart': instance.latitudeStart,
      'longitudeStart': instance.longitudeStart,
      'altitudeStart': instance.altitudeStart,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speedMetersPerSec': instance.speedMetersPerSec,
      'headingDegrees': instance.headingDegrees,
      'locationAccuracy': instance.locationAccuracy,
      'speedAccuracy': instance.speedAccuracy,
      'altitudeMax': instance.altitudeMax,
      'altitudeMin': instance.altitudeMin,
      'speedMax': instance.speedMax,
      'speedMin': instance.speedMin,
      'averageSpeedMetersPerSec': instance.averageSpeedMetersPerSec,
      'netHeadingDegrees': instance.netHeadingDegrees,
      'distanceTraveled': instance.distanceTraveled,
      'netElevationChange': instance.netElevationChange,
      'cumulativeClimbMeters': instance.cumulativeClimbMeters,
      'cumulativeDescentMeters': instance.cumulativeDescentMeters,
      'metricPeriodSeconds': instance.metricPeriodSeconds,
    };

_$MetricImpl _$$MetricImplFromJson(Map<String, dynamic> json) => _$MetricImpl(
      name: json['name'] as String? ?? "",
      value: json['value'] as String? ?? "",
      visible: json['visible'] as bool? ?? true,
    );

Map<String, dynamic> _$$MetricImplToJson(_$MetricImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'visible': instance.visible,
    };
