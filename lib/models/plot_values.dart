import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiking_app/models/location_accuracy_type.dart';
import 'package:kt_dart/collection.dart';

part 'plot_values.freezed.dart';
part 'plot_values.g.dart';

typedef String AxisFormat(double d);
typedef TextStyle AxisTextStyle(double d);

@freezed
class PlotValues with _$PlotValues {
  const factory PlotValues._({
    required List<List<double>> values,
    required PlotFormat xFormat,
    required PlotFormat yFormat,
    required double height,
    required double width,
  }) = _PlotValues;
  factory PlotValues({
    List<List<double>>? values,
    PlotFormat? xFormat,
    PlotFormat? yFormat,
    double? height,
    double? width,
  }) {
    return PlotValues._(
      values: values ??
          [
            [0, 0]
          ],
      xFormat: xFormat ?? const PlotFormat(),
      yFormat: yFormat ?? const PlotFormat(),
      height: height ?? 140,
      width: width ?? 180,
    );
  }

  factory PlotValues.fromJson(Map<String, dynamic> json) =>
      _$PlotValuesFromJson(json);
}

@freezed
class PlotFormat with _$PlotFormat {
  const factory PlotFormat({
    double? min,
    double? max,
    String? axisTitle,
    // AxisFormat axisFormatFunc,
    double? interval,
    // TextStyle axisTextStyle,
    // AxisTextStyle axisTextStyleFunc,
  }) = _PlotFormat;

  factory PlotFormat.fromJson(Map<String, dynamic> json) =>
      _$PlotFormatFromJson(json);
}
