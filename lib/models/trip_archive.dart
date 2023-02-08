import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiking_app/models/plot_values.dart';

import 'hike_metrics.dart';
import 'location_status.dart';

part 'trip_archive.freezed.dart';
part 'trip_archive.g.dart';

@freezed
class TripArchive with _$TripArchive {
  const factory TripArchive({
    @Default([]) List<TripSegment> tripSegments,
    String? tripName,
    HikeMetrics? hikeMetrics,
    @Default([]) List<LocationStatus> locationHistory,
    @Default([]) List<LocationStatus> unfilteredLocationHistory,
    PlotValues? elevationPlot,
    PlotValues? speedPlot,
  }) = _TripArchive;

  factory TripArchive.fromJson(Map<String, dynamic> json) =>
      _$TripArchiveFromJson(json);
}

@freezed
class TripSegment with _$TripSegment {
  const factory TripSegment({
    HikeMetrics? hikeMetrics,
    @Default([]) List<LocationStatus> locationHistory,
    @Default([]) List<LocationStatus> unfilteredLocationHistory,
    PlotValues? elevationPlot,
    PlotValues? speedPlot,
  }) = _TripSegment;

  factory TripSegment.fromJson(Map<String, dynamic> json) =>
      _$TripSegmentFromJson(json);
}
