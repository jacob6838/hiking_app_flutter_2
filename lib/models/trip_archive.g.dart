// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripArchive _$$_TripArchiveFromJson(Map<String, dynamic> json) =>
    _$_TripArchive(
      tripSegments: (json['tripSegments'] as List<dynamic>?)
              ?.map((e) => TripSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tripName: json['tripName'] as String?,
      hikeMetrics: json['hikeMetrics'] == null
          ? null
          : HikeMetrics.fromJson(json['hikeMetrics'] as Map<String, dynamic>),
      locationHistory: (json['locationHistory'] as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unfilteredLocationHistory: (json['unfilteredLocationHistory']
                  as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      elevationPlot: json['elevationPlot'] == null
          ? null
          : PlotValues.fromJson(json['elevationPlot'] as Map<String, dynamic>),
      speedPlot: json['speedPlot'] == null
          ? null
          : PlotValues.fromJson(json['speedPlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TripArchiveToJson(_$_TripArchive instance) =>
    <String, dynamic>{
      'tripSegments': instance.tripSegments,
      'tripName': instance.tripName,
      'hikeMetrics': instance.hikeMetrics,
      'locationHistory': instance.locationHistory,
      'unfilteredLocationHistory': instance.unfilteredLocationHistory,
      'elevationPlot': instance.elevationPlot,
      'speedPlot': instance.speedPlot,
    };

_$_TripSegment _$$_TripSegmentFromJson(Map<String, dynamic> json) =>
    _$_TripSegment(
      hikeMetrics: json['hikeMetrics'] == null
          ? null
          : HikeMetrics.fromJson(json['hikeMetrics'] as Map<String, dynamic>),
      locationHistory: (json['locationHistory'] as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unfilteredLocationHistory: (json['unfilteredLocationHistory']
                  as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      elevationPlot: json['elevationPlot'] == null
          ? null
          : PlotValues.fromJson(json['elevationPlot'] as Map<String, dynamic>),
      speedPlot: json['speedPlot'] == null
          ? null
          : PlotValues.fromJson(json['speedPlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TripSegmentToJson(_$_TripSegment instance) =>
    <String, dynamic>{
      'hikeMetrics': instance.hikeMetrics,
      'locationHistory': instance.locationHistory,
      'unfilteredLocationHistory': instance.unfilteredLocationHistory,
      'elevationPlot': instance.elevationPlot,
      'speedPlot': instance.speedPlot,
    };
