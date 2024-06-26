// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationStatusImpl _$$LocationStatusImplFromJson(Map<String, dynamic> json) =>
    _$LocationStatusImpl(
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      accuracyValue: (json['accuracyValue'] as num?)?.toDouble() ?? 0.0,
      accuracy: $enumDecodeNullable(
              _$LocationAccuracyTypeEnumMap, json['accuracy']) ??
          LocationAccuracyType.low,
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0.0,
      speedMetersPerSec: (json['speedMetersPerSec'] as num?)?.toDouble() ?? 0.0,
      speedAccuracyValue:
          (json['speedAccuracyValue'] as num?)?.toDouble() ?? 0.0,
      speedAccuracy: $enumDecodeNullable(
              _$LocationAccuracyTypeEnumMap, json['speedAccuracy']) ??
          LocationAccuracyType.low,
      headingDegrees: (json['headingDegrees'] as num?)?.toDouble() ?? 0.0,
      timeStampSec: (json['timeStampSec'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$LocationStatusImplToJson(
        _$LocationStatusImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracyValue': instance.accuracyValue,
      'accuracy': _$LocationAccuracyTypeEnumMap[instance.accuracy]!,
      'altitude': instance.altitude,
      'speedMetersPerSec': instance.speedMetersPerSec,
      'speedAccuracyValue': instance.speedAccuracyValue,
      'speedAccuracy': _$LocationAccuracyTypeEnumMap[instance.speedAccuracy]!,
      'headingDegrees': instance.headingDegrees,
      'timeStampSec': instance.timeStampSec,
    };

const _$LocationAccuracyTypeEnumMap = {
  LocationAccuracyType.high: 'high',
  LocationAccuracyType.medium: 'medium',
  LocationAccuracyType.low: 'low',
};
