// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlotValuesImpl _$$PlotValuesImplFromJson(Map<String, dynamic> json) =>
    _$PlotValuesImpl(
      values: (json['values'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      xFormat: PlotFormat.fromJson(json['xFormat'] as Map<String, dynamic>),
      yFormat: PlotFormat.fromJson(json['yFormat'] as Map<String, dynamic>),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlotValuesImplToJson(_$PlotValuesImpl instance) =>
    <String, dynamic>{
      'values': instance.values,
      'xFormat': instance.xFormat,
      'yFormat': instance.yFormat,
      'height': instance.height,
      'width': instance.width,
    };

_$PlotFormatImpl _$$PlotFormatImplFromJson(Map<String, dynamic> json) =>
    _$PlotFormatImpl(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      axisTitle: json['axisTitle'] as String?,
      interval: (json['interval'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlotFormatImplToJson(_$PlotFormatImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'axisTitle': instance.axisTitle,
      'interval': instance.interval,
    };
