import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiking_app/models/plot_values.dart';

import 'hike_metrics.dart';
import 'location_status.dart';

part 'data_archive.freezed.dart';
part 'data_archive.g.dart';

@freezed
@JsonSerializable()
abstract class TripArchive with _$TripArchive {
  const factory TripArchive({
    List<TripSegment> tripSegments,
    String tripName,
    List<LocationStatus>? locationHistory,
    List<LocationStatus>? unfilteredLocationHistory,
    PlotValues? elevationPlot,
    PlotValues? speedPlot,
  }) = _TripArchive;

  @override
  factory TripArchive.fromJson(Map<String, dynamic> json) => _$TripArchiveFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TripArchiveToJson(this);
}

@freezed
@JsonSerializable()
abstract class TripSegment with _$TripSegment {
  const factory TripSegment({
    HikeMetrics? hikeMetrics,
    List<LocationStatus>? locationHistory,
    List<LocationStatus>? unfilteredLocationHistory,
    PlotValues? elevationPlot,
    PlotValues? speedPlot,
  }) = _TripSegment;

  @override
  factory TripSegment.fromJson(Map<String, dynamic> json) => _$TripSegmentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TripSegmentToJson(this);
}
