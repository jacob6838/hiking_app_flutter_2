// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripSummaryImpl _$$TripSummaryImplFromJson(Map<String, dynamic> json) =>
    _$TripSummaryImpl(
      fileName: json['fileName'] as String? ?? "",
      name: json['name'] as String? ?? "",
      locationName: json['locationName'] as String? ?? "",
      startLatitude: (json['startLatitude'] as num?)?.toDouble() ?? 0.0,
      startLongitude: (json['startLongitude'] as num?)?.toDouble() ?? 0.0,
      startTimeSeconds: (json['startTimeSeconds'] as num?)?.toInt() ?? 0,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt() ?? 0,
      distanceMeters: (json['distanceMeters'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TripSummaryImplToJson(_$TripSummaryImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'name': instance.name,
      'locationName': instance.locationName,
      'startLatitude': instance.startLatitude,
      'startLongitude': instance.startLongitude,
      'startTimeSeconds': instance.startTimeSeconds,
      'durationSeconds': instance.durationSeconds,
      'distanceMeters': instance.distanceMeters,
    };
