// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationStatus _$LocationStatusFromJson(Map<String, dynamic> json) =>
    LocationStatus(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracyValue: (json['accuracyValue'] as num).toDouble(),
      accuracy: $enumDecode(_$LocationAccuracyTypeEnumMap, json['accuracy']),
      altitude: (json['altitude'] as num).toDouble(),
      speedMetersPerSec: (json['speedMetersPerSec'] as num).toDouble(),
      speedAccuracyValue: (json['speedAccuracyValue'] as num).toDouble(),
      speedAccuracy:
          $enumDecode(_$LocationAccuracyTypeEnumMap, json['speedAccuracy']),
      headingDegrees: (json['headingDegrees'] as num).toDouble(),
      timeStampSec: (json['timeStampSec'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationStatusToJson(LocationStatus instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracyValue': instance.accuracyValue,
      'accuracy': _$LocationAccuracyTypeEnumMap[instance.accuracy],
      'altitude': instance.altitude,
      'speedMetersPerSec': instance.speedMetersPerSec,
      'speedAccuracyValue': instance.speedAccuracyValue,
      'speedAccuracy': _$LocationAccuracyTypeEnumMap[instance.speedAccuracy],
      'headingDegrees': instance.headingDegrees,
      'timeStampSec': instance.timeStampSec,
    };

const _$LocationAccuracyTypeEnumMap = {
  LocationAccuracyType.high: 'high',
  LocationAccuracyType.medium: 'medium',
  LocationAccuracyType.low: 'low',
};

_$_LocationStatus _$$_LocationStatusFromJson(Map<String, dynamic> json) =>
    _$_LocationStatus(
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

Map<String, dynamic> _$$_LocationStatusToJson(_$_LocationStatus instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracyValue': instance.accuracyValue,
      'accuracy': _$LocationAccuracyTypeEnumMap[instance.accuracy],
      'altitude': instance.altitude,
      'speedMetersPerSec': instance.speedMetersPerSec,
      'speedAccuracyValue': instance.speedAccuracyValue,
      'speedAccuracy': _$LocationAccuracyTypeEnumMap[instance.speedAccuracy],
      'headingDegrees': instance.headingDegrees,
      'timeStampSec': instance.timeStampSec,
    };
