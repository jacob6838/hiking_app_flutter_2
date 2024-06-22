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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataArchive _$DataArchiveFromJson(Map<String, dynamic> json) {
  return _DataArchive.fromJson(json);
}

/// @nodoc
mixin _$DataArchive {
  LocationSummary? get locationSummary => throw _privateConstructorUsedError;
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
      {LocationSummary? locationSummary,
      HikeMetrics? hikeMetrics,
      List<LocationStatus>? locationHistory,
      List<LocationStatus>? unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  $LocationSummaryCopyWith<$Res>? get locationSummary;
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
    Object? locationSummary = freezed,
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? unfilteredLocationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_value.copyWith(
      locationSummary: freezed == locationSummary
          ? _value.locationSummary
          : locationSummary // ignore: cast_nullable_to_non_nullable
              as LocationSummary?,
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
  $LocationSummaryCopyWith<$Res>? get locationSummary {
    if (_value.locationSummary == null) {
      return null;
    }

    return $LocationSummaryCopyWith<$Res>(_value.locationSummary!, (value) {
      return _then(_value.copyWith(locationSummary: value) as $Val);
    });
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
abstract class _$$DataArchiveImplCopyWith<$Res>
    implements $DataArchiveCopyWith<$Res> {
  factory _$$DataArchiveImplCopyWith(
          _$DataArchiveImpl value, $Res Function(_$DataArchiveImpl) then) =
      __$$DataArchiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationSummary? locationSummary,
      HikeMetrics? hikeMetrics,
      List<LocationStatus>? locationHistory,
      List<LocationStatus>? unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  @override
  $LocationSummaryCopyWith<$Res>? get locationSummary;
  @override
  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  @override
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  @override
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class __$$DataArchiveImplCopyWithImpl<$Res>
    extends _$DataArchiveCopyWithImpl<$Res, _$DataArchiveImpl>
    implements _$$DataArchiveImplCopyWith<$Res> {
  __$$DataArchiveImplCopyWithImpl(
      _$DataArchiveImpl _value, $Res Function(_$DataArchiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationSummary = freezed,
    Object? hikeMetrics = freezed,
    Object? locationHistory = freezed,
    Object? unfilteredLocationHistory = freezed,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_$DataArchiveImpl(
      locationSummary: freezed == locationSummary
          ? _value.locationSummary
          : locationSummary // ignore: cast_nullable_to_non_nullable
              as LocationSummary?,
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
class _$DataArchiveImpl implements _DataArchive {
  const _$DataArchiveImpl(
      {this.locationSummary,
      this.hikeMetrics,
      final List<LocationStatus>? locationHistory,
      final List<LocationStatus>? unfilteredLocationHistory,
      this.elevationPlot,
      this.speedPlot})
      : _locationHistory = locationHistory,
        _unfilteredLocationHistory = unfilteredLocationHistory;

  factory _$DataArchiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataArchiveImplFromJson(json);

  @override
  final LocationSummary? locationSummary;
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
    return 'DataArchive(locationSummary: $locationSummary, hikeMetrics: $hikeMetrics, locationHistory: $locationHistory, unfilteredLocationHistory: $unfilteredLocationHistory, elevationPlot: $elevationPlot, speedPlot: $speedPlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataArchiveImpl &&
            (identical(other.locationSummary, locationSummary) ||
                other.locationSummary == locationSummary) &&
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
      locationSummary,
      hikeMetrics,
      const DeepCollectionEquality().hash(_locationHistory),
      const DeepCollectionEquality().hash(_unfilteredLocationHistory),
      elevationPlot,
      speedPlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataArchiveImplCopyWith<_$DataArchiveImpl> get copyWith =>
      __$$DataArchiveImplCopyWithImpl<_$DataArchiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataArchiveImplToJson(
      this,
    );
  }
}

abstract class _DataArchive implements DataArchive {
  const factory _DataArchive(
      {final LocationSummary? locationSummary,
      final HikeMetrics? hikeMetrics,
      final List<LocationStatus>? locationHistory,
      final List<LocationStatus>? unfilteredLocationHistory,
      final PlotValues? elevationPlot,
      final PlotValues? speedPlot}) = _$DataArchiveImpl;

  factory _DataArchive.fromJson(Map<String, dynamic> json) =
      _$DataArchiveImpl.fromJson;

  @override
  LocationSummary? get locationSummary;
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
  _$$DataArchiveImplCopyWith<_$DataArchiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
