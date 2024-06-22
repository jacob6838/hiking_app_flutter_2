import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_summary.freezed.dart';
part 'trip_summary.g.dart';

@freezed
class TripSummary with _$TripSummary {
  const TripSummary._();
  const factory TripSummary({
    @Default("") String fileName,
    @Default("") String name,
    @Default("") String locationName,
    @Default(0.0) double startLatitude,
    @Default(0.0) double startLongitude,
    @Default(0) int startTimeSeconds,
    @Default(0) int durationSeconds,
    @Default(0) int distanceMeters,
  }) = _TripSummary;

  static TripSummary fromNameString(String fileName) {
    // string is underscore separated values
    List<String> parts = fileName.split("_");
    return TripSummary(
      fileName: fileName,
      name: parts[0].replaceAll("%20", " "),
      locationName: parts[1].replaceAll("%20", " "),
      startLatitude: double.parse(parts[2]),
      startLongitude: double.parse(parts[3]),
      startTimeSeconds: int.parse(parts[4]),
      durationSeconds: int.parse(parts[5]),
      distanceMeters: int.parse(parts[6]),
    );
  }

  String toNameString() {
    return "${name.replaceAll(" ", "%20")}_${locationName.replaceAll(" ", "%20")}_${startLatitude}_${startLongitude}_${startTimeSeconds}_${durationSeconds}_${distanceMeters}";
  }

  factory TripSummary.fromJson(Map<String, dynamic> json) =>
      _$TripSummaryFromJson(json);
}
