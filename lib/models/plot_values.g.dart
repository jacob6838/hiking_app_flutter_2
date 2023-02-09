// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlotValues _$$_PlotValuesFromJson(Map<String, dynamic> json) =>
    _$_PlotValues(
      values: (json['values'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      xFormat: PlotFormat.fromJson(json['xFormat'] as Map<String, dynamic>),
      yFormat: PlotFormat.fromJson(json['yFormat'] as Map<String, dynamic>),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PlotValuesToJson(_$_PlotValues instance) =>
    <String, dynamic>{
      'values': instance.values,
      'xFormat': instance.xFormat,
      'yFormat': instance.yFormat,
      'height': instance.height,
      'width': instance.width,
    };

_$_PlotFormat _$$_PlotFormatFromJson(Map<String, dynamic> json) =>
    _$_PlotFormat(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      axisTitle: json['axisTitle'] as String?,
      interval: (json['interval'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PlotFormatToJson(_$_PlotFormat instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'axisTitle': instance.axisTitle,
      'interval': instance.interval,
    };
