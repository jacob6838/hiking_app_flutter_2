import 'package:freezed_annotation/freezed_annotation.dart';

import 'hike_metrics.dart';

part 'saved_preferences.freezed.dart';
part 'saved_preferences.g.dart';

@freezed
abstract class SavedPreferences with _$SavedPreferences {
  const factory SavedPreferences({
    @Default([]) List<Metric> units,
  }) = _SavedPreferences;

  @override
  factory SavedPreferences.fromJson(Map<String, dynamic> json) =>
      _$SavedPreferencesFromJson(json);
}
