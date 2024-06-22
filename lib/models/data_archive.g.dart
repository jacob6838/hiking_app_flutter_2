// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataArchiveImpl _$$DataArchiveImplFromJson(Map<String, dynamic> json) =>
    _$DataArchiveImpl(
      locationSummary: json['locationSummary'] == null
          ? null
          : LocationSummary.fromJson(
              json['locationSummary'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$DataArchiveImplToJson(_$DataArchiveImpl instance) =>
    <String, dynamic>{
      'locationSummary': instance.locationSummary,
      'hikeMetrics': instance.hikeMetrics,
      'locationHistory': instance.locationHistory,
      'unfilteredLocationHistory': instance.unfilteredLocationHistory,
      'elevationPlot': instance.elevationPlot,
      'speedPlot': instance.speedPlot,
    };
