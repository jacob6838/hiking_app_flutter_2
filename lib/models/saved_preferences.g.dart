// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedPreferences _$$_SavedPreferencesFromJson(Map<String, dynamic> json) =>
    _$_SavedPreferences(
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => Metric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SavedPreferencesToJson(_$_SavedPreferences instance) =>
    <String, dynamic>{
      'units': instance.units,
    };
