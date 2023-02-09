// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_archive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataArchive _$DataArchiveFromJson(Map<String, dynamic> json) {
  return _DataArchive.fromJson(json);
}

/// @nodoc
mixin _$DataArchive {
  HikeMetrics? get hikeMetrics => throw _privateConstructorUsedError;
  List<LocationStatus>? get locationHistory =>
      throw _privateConstructorUsedError;
  List<LocationStatus>? get unfilteredLocationHistory =>
      throw _privateConstructorUsedError;
  PlotValues? get elevationPlot => throw _privateConstructorUsedError;
  PlotValues? get speedPlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataArchiveCopyWith<DataArchive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataArchiveCopyWith<$Res> {
  factory $DataArchiveCopyWith(
          DataArchive value, $Res Function(DataArchive) then) =
      _$DataArchiveCopyWithImpl<$Res, DataArchive>;
  @useResult
  $Res call(
      {HikeMetrics? hikeMetrics,
      List<LocationStatus>? locationHistory,
      List<LocationStatus>? unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class _$DataArchiveCopyWithImpl<$Res, $Val extends DataArchive>
    implements $DataArchiveCopyWith<$Res> {
  _$DataArchiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? unfilteredLocationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_value.copyWith(
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: freezed == locationHistory
          ? _value.locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      unfilteredLocationHistory: freezed == unfilteredLocationHistory
          ? _value.unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      elevationPlot: freezed == elevationPlot
          ? _value.elevationPlot
          : elevationPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
      speedPlot: freezed == speedPlot
          ? _value.speedPlot
          : speedPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HikeMetricsCopyWith<$Res>? get hikeMetrics {
    if (_value.hikeMetrics == null) {
      return null;
    }

    return $HikeMetricsCopyWith<$Res>(_value.hikeMetrics!, (value) {
      return _then(_value.copyWith(hikeMetrics: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlotValuesCopyWith<$Res>? get elevationPlot {
    if (_value.elevationPlot == null) {
      return null;
    }

    return $PlotValuesCopyWith<$Res>(_value.elevationPlot!, (value) {
      return _then(_value.copyWith(elevationPlot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlotValuesCopyWith<$Res>? get speedPlot {
    if (_value.speedPlot == null) {
      return null;
    }

    return $PlotValuesCopyWith<$Res>(_value.speedPlot!, (value) {
      return _then(_value.copyWith(speedPlot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataArchiveCopyWith<$Res>
    implements $DataArchiveCopyWith<$Res> {
  factory _$$_DataArchiveCopyWith(
          _$_DataArchive value, $Res Function(_$_DataArchive) then) =
      __$$_DataArchiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HikeMetrics? hikeMetrics,
      List<LocationStatus>? locationHistory,
      List<LocationStatus>? unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  @override
  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  @override
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  @override
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class __$$_DataArchiveCopyWithImpl<$Res>
    extends _$DataArchiveCopyWithImpl<$Res, _$_DataArchive>
    implements _$$_DataArchiveCopyWith<$Res> {
  __$$_DataArchiveCopyWithImpl(
      _$_DataArchive _value, $Res Function(_$_DataArchive) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? unfilteredLocationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_$_DataArchive(
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: freezed == locationHistory
          ? _value._locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      unfilteredLocationHistory: freezed == unfilteredLocationHistory
          ? _value._unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      elevationPlot: freezed == elevationPlot
          ? _value.elevationPlot
          : elevationPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
      speedPlot: freezed == speedPlot
          ? _value.speedPlot
          : speedPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataArchive implements _DataArchive {
  const _$_DataArchive(
      {this.hikeMetrics,
      final List<LocationStatus>? locationHistory,
      final List<LocationStatus>? unfilteredLocationHistory,
      this.elevationPlot,
      this.speedPlot})
      : _locationHistory = locationHistory,
        _unfilteredLocationHistory = unfilteredLocationHistory;

  factory _$_DataArchive.fromJson(Map<String, dynamic> json) =>
      _$$_DataArchiveFromJson(json);

  @override
  final HikeMetrics? hikeMetrics;
  final List<LocationStatus>? _locationHistory;
  @override
  List<LocationStatus>? get locationHistory {
    final value = _locationHistory;
    if (value == null) return null;
    if (_locationHistory is EqualUnmodifiableListView) return _locationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LocationStatus>? _unfilteredLocationHistory;
  @override
  List<LocationStatus>? get unfilteredLocationHistory {
    final value = _unfilteredLocationHistory;
    if (value == null) return null;
    if (_unfilteredLocationHistory is EqualUnmodifiableListView)
      return _unfilteredLocationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PlotValues? elevationPlot;
  @override
  final PlotValues? speedPlot;

  @override
  String toString() {
    return 'DataArchive(hikeMetrics: $hikeMetrics, locationHistory: $locationHistory, unfilteredLocationHistory: $unfilteredLocationHistory, elevationPlot: $elevationPlot, speedPlot: $speedPlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataArchive &&
            (identical(other.hikeMetrics, hikeMetrics) ||
                other.hikeMetrics == hikeMetrics) &&
            const DeepCollectionEquality()
                .equals(other._locationHistory, _locationHistory) &&
            const DeepCollectionEquality().equals(
                other._unfilteredLocationHistory, _unfilteredLocationHistory) &&
            (identical(other.elevationPlot, elevationPlot) ||
                other.elevationPlot == elevationPlot) &&
            (identical(other.speedPlot, speedPlot) ||
                other.speedPlot == speedPlot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hikeMetrics,
      const DeepCollectionEquality().hash(_locationHistory),
      const DeepCollectionEquality().hash(_unfilteredLocationHistory),
      elevationPlot,
      speedPlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataArchiveCopyWith<_$_DataArchive> get copyWith =>
      __$$_DataArchiveCopyWithImpl<_$_DataArchive>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataArchiveToJson(
      this,
    );
  }
}

abstract class _DataArchive implements DataArchive {
  const factory _DataArchive(
      {final HikeMetrics? hikeMetrics,
      final List<LocationStatus>? locationHistory,
      final List<LocationStatus>? unfilteredLocationHistory,
      final PlotValues? elevationPlot,
      final PlotValues? speedPlot}) = _$_DataArchive;

  factory _DataArchive.fromJson(Map<String, dynamic> json) =
      _$_DataArchive.fromJson;

  @override
  HikeMetrics? get hikeMetrics;
  @override
  List<LocationStatus>? get locationHistory;
  @override
  List<LocationStatus>? get unfilteredLocationHistory;
  @override
  PlotValues? get elevationPlot;
  @override
  PlotValues? get speedPlot;
  @override
  @JsonKey(ignore: true)
  _$$_DataArchiveCopyWith<_$_DataArchive> get copyWith =>
      throw _privateConstructorUsedError;
}
