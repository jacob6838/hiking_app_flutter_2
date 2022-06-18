// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_archive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataArchive {
  HikeMetrics? get hikeMetrics => throw _privateConstructorUsedError;
  List<LocationStatus>? get locationHistory => throw _privateConstructorUsedError;
  PlotValues? get elevationPlot => throw _privateConstructorUsedError;
  PlotValues? get speedPlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataArchiveCopyWith<DataArchive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataArchiveCopyWith<$Res> {
  factory $DataArchiveCopyWith(DataArchive value, $Res Function(DataArchive) then) = _$DataArchiveCopyWithImpl<$Res>;
  $Res call({HikeMetrics? hikeMetrics, List<LocationStatus>? locationHistory, PlotValues? elevationPlot, PlotValues? speedPlot});

  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class _$DataArchiveCopyWithImpl<$Res> implements $DataArchiveCopyWith<$Res> {
  _$DataArchiveCopyWithImpl(this._value, this._then);

  final DataArchive _value;
  // ignore: unused_field
  final $Res Function(DataArchive) _then;

  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_value.copyWith(
      hikeMetrics: hikeMetrics == freezed
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: locationHistory == freezed
          ? _value.locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      elevationPlot: elevationPlot == freezed
          ? _value.elevationPlot
          : elevationPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
      speedPlot: speedPlot == freezed
          ? _value.speedPlot
          : speedPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
    ));
  }

  @override
  $HikeMetricsCopyWith<$Res>? get hikeMetrics {
    if (_value.hikeMetrics == null) {
      return null;
    }

    return $HikeMetricsCopyWith<$Res>(_value.hikeMetrics!, (value) {
      return _then(_value.copyWith(hikeMetrics: value));
    });
  }

  @override
  $PlotValuesCopyWith<$Res>? get elevationPlot {
    if (_value.elevationPlot == null) {
      return null;
    }

    return $PlotValuesCopyWith<$Res>(_value.elevationPlot!, (value) {
      return _then(_value.copyWith(elevationPlot: value));
    });
  }

  @override
  $PlotValuesCopyWith<$Res>? get speedPlot {
    if (_value.speedPlot == null) {
      return null;
    }

    return $PlotValuesCopyWith<$Res>(_value.speedPlot!, (value) {
      return _then(_value.copyWith(speedPlot: value));
    });
  }
}

/// @nodoc
abstract class _$$_DataArchiveCopyWith<$Res> implements $DataArchiveCopyWith<$Res> {
  factory _$$_DataArchiveCopyWith(_$_DataArchive value, $Res Function(_$_DataArchive) then) = __$$_DataArchiveCopyWithImpl<$Res>;
  @override
  $Res call({HikeMetrics? hikeMetrics, List<LocationStatus>? locationHistory, PlotValues? elevationPlot, PlotValues? speedPlot});

  @override
  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  @override
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  @override
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class __$$_DataArchiveCopyWithImpl<$Res> extends _$DataArchiveCopyWithImpl<$Res> implements _$$_DataArchiveCopyWith<$Res> {
  __$$_DataArchiveCopyWithImpl(_$_DataArchive _value, $Res Function(_$_DataArchive) _then)
      : super(_value, (v) => _then(v as _$_DataArchive));

  @override
  _$_DataArchive get _value => super._value as _$_DataArchive;

  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_$_DataArchive(
      hikeMetrics: hikeMetrics == freezed
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: locationHistory == freezed
          ? _value._locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>?,
      elevationPlot: elevationPlot == freezed
          ? _value.elevationPlot
          : elevationPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
      speedPlot: speedPlot == freezed
          ? _value.speedPlot
          : speedPlot // ignore: cast_nullable_to_non_nullable
              as PlotValues?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataArchive implements _DataArchive {
  const _$_DataArchive({this.hikeMetrics, final List<LocationStatus>? locationHistory, this.elevationPlot, this.speedPlot})
      : _locationHistory = locationHistory;

  factory _$_DataArchive.fromJson(Map<String, dynamic> json) => _$$_DataArchiveFromJson(json);

  @override
  final HikeMetrics? hikeMetrics;
  final List<LocationStatus>? _locationHistory;
  @override
  List<LocationStatus>? get locationHistory {
    final value = _locationHistory;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PlotValues? elevationPlot;
  @override
  final PlotValues? speedPlot;

  @override
  String toString() {
    return 'DataArchive(hikeMetrics: $hikeMetrics, locationHistory: $locationHistory, elevationPlot: $elevationPlot, speedPlot: $speedPlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataArchive &&
            const DeepCollectionEquality().equals(other.hikeMetrics, hikeMetrics) &&
            const DeepCollectionEquality().equals(other._locationHistory, _locationHistory) &&
            const DeepCollectionEquality().equals(other.elevationPlot, elevationPlot) &&
            const DeepCollectionEquality().equals(other.speedPlot, speedPlot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hikeMetrics),
      const DeepCollectionEquality().hash(_locationHistory),
      const DeepCollectionEquality().hash(elevationPlot),
      const DeepCollectionEquality().hash(speedPlot));

  @JsonKey(ignore: true)
  @override
  _$$_DataArchiveCopyWith<_$_DataArchive> get copyWith => __$$_DataArchiveCopyWithImpl<_$_DataArchive>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataArchiveToJson(this);
  }
}

abstract class _DataArchive implements DataArchive {
  const factory _DataArchive(
      {final HikeMetrics? hikeMetrics,
      final List<LocationStatus>? locationHistory,
      final PlotValues? elevationPlot,
      final PlotValues? speedPlot}) = _$_DataArchive;

  factory _DataArchive.fromJson(Map<String, dynamic> json) = _$_DataArchive.fromJson;

  @override
  HikeMetrics? get hikeMetrics => throw _privateConstructorUsedError;
  @override
  List<LocationStatus>? get locationHistory => throw _privateConstructorUsedError;
  @override
  PlotValues? get elevationPlot => throw _privateConstructorUsedError;
  @override
  PlotValues? get speedPlot => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DataArchiveCopyWith<_$_DataArchive> get copyWith => throw _privateConstructorUsedError;
}
