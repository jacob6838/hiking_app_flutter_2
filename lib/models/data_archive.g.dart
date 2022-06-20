// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataArchive _$DataArchiveFromJson(Map<String, dynamic> json) => DataArchive(
      hikeMetrics: json['hikeMetrics'] == null
          ? null
          : HikeMetrics.fromJson(json['hikeMetrics'] as Map<String, dynamic>),
      locationHistory: (json['locationHistory'] as List<dynamic>?)
          ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      unfilteredLocationHistory:
          (json['unfilteredLocationHistory'] as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList(),
      elevationPlot: json['elevationPlot'] == null
          ? null
          : PlotValues.fromJson(json['elevationPlot'] as Map<String, dynamic>),
      speedPlot: json['speedPlot'] == null
          ? null
          : PlotValues.fromJson(json['speedPlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataArchiveToJson(DataArchive instance) =>
    <String, dynamic>{
      'hikeMetrics': instance.hikeMetrics,
      'locationHistory': instance.locationHistory,
      'unfilteredLocationHistory': instance.unfilteredLocationHistory,
      'elevationPlot': instance.elevationPlot,
      'speedPlot': instance.speedPlot,
    };

_$_DataArchive _$$_DataArchiveFromJson(Map<String, dynamic> json) =>
    _$_DataArchive(
      hikeMetrics: json['hikeMetrics'] == null
          ? null
          : HikeMetrics.fromJson(json['hikeMetrics'] as Map<String, dynamic>),
      locationHistory: (json['locationHistory'] as List<dynamic>?)
          ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      unfilteredLocationHistory:
          (json['unfilteredLocationHistory'] as List<dynamic>?)
              ?.map((e) => LocationStatus.fromJson(e as Map<String, dynamic>))
              .toList(),
      elevationPlot: json['elevationPlot'] == null
          ? null
          : PlotValues.fromJson(json['elevationPlot'] as Map<String, dynamic>),
      speedPlot: json['speedPlot'] == null
          ? null
          : PlotValues.fromJson(json['speedPlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataArchiveToJson(_$_DataArchive instance) =>
    <String, dynamic>{
      'hikeMetrics': instance.hikeMetrics,
      'locationHistory': instance.locationHistory,
      'unfilteredLocationHistory': instance.unfilteredLocationHistory,
      'elevationPlot': instance.elevationPlot,
      'speedPlot': instance.speedPlot,
    };
