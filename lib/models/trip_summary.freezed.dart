// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripSummary _$TripSummaryFromJson(Map<String, dynamic> json) {
  return _TripSummary.fromJson(json);
}

/// @nodoc
mixin _$TripSummary {
  String get fileName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  double get startLatitude => throw _privateConstructorUsedError;
  double get startLongitude => throw _privateConstructorUsedError;
  int get startTimeSeconds => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  int get distanceMeters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripSummaryCopyWith<TripSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripSummaryCopyWith<$Res> {
  factory $TripSummaryCopyWith(
          TripSummary value, $Res Function(TripSummary) then) =
      _$TripSummaryCopyWithImpl<$Res, TripSummary>;
  @useResult
  $Res call(
      {String fileName,
      String name,
      String locationName,
      double startLatitude,
      double startLongitude,
      int startTimeSeconds,
      int durationSeconds,
      int distanceMeters});
}

/// @nodoc
class _$TripSummaryCopyWithImpl<$Res, $Val extends TripSummary>
    implements $TripSummaryCopyWith<$Res> {
  _$TripSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? name = null,
    Object? locationName = null,
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? startTimeSeconds = null,
    Object? durationSeconds = null,
    Object? distanceMeters = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      startTimeSeconds: null == startTimeSeconds
          ? _value.startTimeSeconds
          : startTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      distanceMeters: null == distanceMeters
          ? _value.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripSummaryImplCopyWith<$Res>
    implements $TripSummaryCopyWith<$Res> {
  factory _$$TripSummaryImplCopyWith(
          _$TripSummaryImpl value, $Res Function(_$TripSummaryImpl) then) =
      __$$TripSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fileName,
      String name,
      String locationName,
      double startLatitude,
      double startLongitude,
      int startTimeSeconds,
      int durationSeconds,
      int distanceMeters});
}

/// @nodoc
class __$$TripSummaryImplCopyWithImpl<$Res>
    extends _$TripSummaryCopyWithImpl<$Res, _$TripSummaryImpl>
    implements _$$TripSummaryImplCopyWith<$Res> {
  __$$TripSummaryImplCopyWithImpl(
      _$TripSummaryImpl _value, $Res Function(_$TripSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? name = null,
    Object? locationName = null,
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? startTimeSeconds = null,
    Object? durationSeconds = null,
    Object? distanceMeters = null,
  }) {
    return _then(_$TripSummaryImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      startTimeSeconds: null == startTimeSeconds
          ? _value.startTimeSeconds
          : startTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      distanceMeters: null == distanceMeters
          ? _value.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripSummaryImpl extends _TripSummary {
  const _$TripSummaryImpl(
      {this.fileName = "",
      this.name = "",
      this.locationName = "",
      this.startLatitude = 0.0,
      this.startLongitude = 0.0,
      this.startTimeSeconds = 0,
      this.durationSeconds = 0,
      this.distanceMeters = 0})
      : super._();

  factory _$TripSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripSummaryImplFromJson(json);

  @override
  @JsonKey()
  final String fileName;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String locationName;
  @override
  @JsonKey()
  final double startLatitude;
  @override
  @JsonKey()
  final double startLongitude;
  @override
  @JsonKey()
  final int startTimeSeconds;
  @override
  @JsonKey()
  final int durationSeconds;
  @override
  @JsonKey()
  final int distanceMeters;

  @override
  String toString() {
    return 'TripSummary(fileName: $fileName, name: $name, locationName: $locationName, startLatitude: $startLatitude, startLongitude: $startLongitude, startTimeSeconds: $startTimeSeconds, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripSummaryImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.startLatitude, startLatitude) ||
                other.startLatitude == startLatitude) &&
            (identical(other.startLongitude, startLongitude) ||
                other.startLongitude == startLongitude) &&
            (identical(other.startTimeSeconds, startTimeSeconds) ||
                other.startTimeSeconds == startTimeSeconds) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fileName,
      name,
      locationName,
      startLatitude,
      startLongitude,
      startTimeSeconds,
      durationSeconds,
      distanceMeters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripSummaryImplCopyWith<_$TripSummaryImpl> get copyWith =>
      __$$TripSummaryImplCopyWithImpl<_$TripSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripSummaryImplToJson(
      this,
    );
  }
}

abstract class _TripSummary extends TripSummary {
  const factory _TripSummary(
      {final String fileName,
      final String name,
      final String locationName,
      final double startLatitude,
      final double startLongitude,
      final int startTimeSeconds,
      final int durationSeconds,
      final int distanceMeters}) = _$TripSummaryImpl;
  const _TripSummary._() : super._();

  factory _TripSummary.fromJson(Map<String, dynamic> json) =
      _$TripSummaryImpl.fromJson;

  @override
  String get fileName;
  @override
  String get name;
  @override
  String get locationName;
  @override
  double get startLatitude;
  @override
  double get startLongitude;
  @override
  int get startTimeSeconds;
  @override
  int get durationSeconds;
  @override
  int get distanceMeters;
  @override
  @JsonKey(ignore: true)
  _$$TripSummaryImplCopyWith<_$TripSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
