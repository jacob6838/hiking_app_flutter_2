// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedPreferences _$SavedPreferencesFromJson(Map<String, dynamic> json) {
  return _SavedPreferences.fromJson(json);
}

/// @nodoc
mixin _$SavedPreferences {
  List<Metric> get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedPreferencesCopyWith<SavedPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPreferencesCopyWith<$Res> {
  factory $SavedPreferencesCopyWith(
          SavedPreferences value, $Res Function(SavedPreferences) then) =
      _$SavedPreferencesCopyWithImpl<$Res, SavedPreferences>;
  @useResult
  $Res call({List<Metric> units});
}

/// @nodoc
class _$SavedPreferencesCopyWithImpl<$Res, $Val extends SavedPreferences>
    implements $SavedPreferencesCopyWith<$Res> {
  _$SavedPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
  }) {
    return _then(_value.copyWith(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Metric>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedPreferencesCopyWith<$Res>
    implements $SavedPreferencesCopyWith<$Res> {
  factory _$$_SavedPreferencesCopyWith(
          _$_SavedPreferences value, $Res Function(_$_SavedPreferences) then) =
      __$$_SavedPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Metric> units});
}

/// @nodoc
class __$$_SavedPreferencesCopyWithImpl<$Res>
    extends _$SavedPreferencesCopyWithImpl<$Res, _$_SavedPreferences>
    implements _$$_SavedPreferencesCopyWith<$Res> {
  __$$_SavedPreferencesCopyWithImpl(
      _$_SavedPreferences _value, $Res Function(_$_SavedPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
  }) {
    return _then(_$_SavedPreferences(
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Metric>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedPreferences implements _SavedPreferences {
  const _$_SavedPreferences({final List<Metric> units = const []})
      : _units = units;

  factory _$_SavedPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_SavedPreferencesFromJson(json);

  final List<Metric> _units;
  @override
  @JsonKey()
  List<Metric> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  String toString() {
    return 'SavedPreferences(units: $units)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedPreferences &&
            const DeepCollectionEquality().equals(other._units, _units));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_units));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedPreferencesCopyWith<_$_SavedPreferences> get copyWith =>
      __$$_SavedPreferencesCopyWithImpl<_$_SavedPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedPreferencesToJson(
      this,
    );
  }
}

abstract class _SavedPreferences implements SavedPreferences {
  const factory _SavedPreferences({final List<Metric> units}) =
      _$_SavedPreferences;

  factory _SavedPreferences.fromJson(Map<String, dynamic> json) =
      _$_SavedPreferences.fromJson;

  @override
  List<Metric> get units;
  @override
  @JsonKey(ignore: true)
  _$$_SavedPreferencesCopyWith<_$_SavedPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
