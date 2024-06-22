import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiking_app/models/location_summary.dart';
import 'package:hiking_app/models/plot_values.dart';

import 'hike_metrics.dart';
import 'location_status.dart';

part 'data_archive.freezed.dart';
part 'data_archive.g.dart';

@freezed
abstract class DataArchive with _$DataArchive {
  const factory DataArchive({
    LocationSummary? locationSummary,
    HikeMetrics? hikeMetrics,
    List<LocationStatus>? locationHistory,
    List<LocationStatus>? unfilteredLocationHistory,
    PlotValues? elevationPlot,
    PlotValues? speedPlot,
  }) = _DataArchive;

  @override
  factory DataArchive.fromJson(Map<String, dynamic> json) =>
      _$DataArchiveFromJson(json);
}
