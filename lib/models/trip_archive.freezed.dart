// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_archive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripArchive _$TripArchiveFromJson(Map<String, dynamic> json) {
  return _TripArchive.fromJson(json);
}

/// @nodoc
mixin _$TripArchive {
  List<TripSegment> get tripSegments => throw _privateConstructorUsedError;
  String? get tripName => throw _privateConstructorUsedError;
  HikeMetrics? get hikeMetrics => throw _privateConstructorUsedError;
  List<LocationStatus> get locationHistory =>
      throw _privateConstructorUsedError;
  List<LocationStatus> get unfilteredLocationHistory =>
      throw _privateConstructorUsedError;
  PlotValues? get elevationPlot => throw _privateConstructorUsedError;
  PlotValues? get speedPlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripArchiveCopyWith<TripArchive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripArchiveCopyWith<$Res> {
  factory $TripArchiveCopyWith(
          TripArchive value, $Res Function(TripArchive) then) =
      _$TripArchiveCopyWithImpl<$Res, TripArchive>;
  @useResult
  $Res call(
      {List<TripSegment> tripSegments,
      String? tripName,
      HikeMetrics? hikeMetrics,
      List<LocationStatus> locationHistory,
      List<LocationStatus> unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class _$TripArchiveCopyWithImpl<$Res, $Val extends TripArchive>
    implements $TripArchiveCopyWith<$Res> {
  _$TripArchiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripSegments = null,
    Object? tripName = freezed,
    Object? hikeMetrics = freezed,
    Object? locationHistory = null,
    Object? unfilteredLocationHistory = null,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_value.copyWith(
      tripSegments: null == tripSegments
          ? _value.tripSegments
          : tripSegments // ignore: cast_nullable_to_non_nullable
              as List<TripSegment>,
      tripName: freezed == tripName
          ? _value.tripName
          : tripName // ignore: cast_nullable_to_non_nullable
              as String?,
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: null == locationHistory
          ? _value.locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
      unfilteredLocationHistory: null == unfilteredLocationHistory
          ? _value.unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
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
abstract class _$$_TripArchiveCopyWith<$Res>
    implements $TripArchiveCopyWith<$Res> {
  factory _$$_TripArchiveCopyWith(
          _$_TripArchive value, $Res Function(_$_TripArchive) then) =
      __$$_TripArchiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TripSegment> tripSegments,
      String? tripName,
      HikeMetrics? hikeMetrics,
      List<LocationStatus> locationHistory,
      List<LocationStatus> unfilteredLocationHistory,
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
class __$$_TripArchiveCopyWithImpl<$Res>
    extends _$TripArchiveCopyWithImpl<$Res, _$_TripArchive>
    implements _$$_TripArchiveCopyWith<$Res> {
  __$$_TripArchiveCopyWithImpl(
      _$_TripArchive _value, $Res Function(_$_TripArchive) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripSegments = null,
    Object? tripName = freezed,
    Object? hikeMetrics = freezed,
    Object? locationHistory = null,
    Object? unfilteredLocationHistory = null,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_$_TripArchive(
      tripSegments: null == tripSegments
          ? _value._tripSegments
          : tripSegments // ignore: cast_nullable_to_non_nullable
              as List<TripSegment>,
      tripName: freezed == tripName
          ? _value.tripName
          : tripName // ignore: cast_nullable_to_non_nullable
              as String?,
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: null == locationHistory
          ? _value._locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
      unfilteredLocationHistory: null == unfilteredLocationHistory
          ? _value._unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
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
class _$_TripArchive implements _TripArchive {
  const _$_TripArchive(
      {final List<TripSegment> tripSegments = const [],
      this.tripName,
      this.hikeMetrics,
      final List<LocationStatus> locationHistory = const [],
      final List<LocationStatus> unfilteredLocationHistory = const [],
      this.elevationPlot,
      this.speedPlot})
      : _tripSegments = tripSegments,
        _locationHistory = locationHistory,
        _unfilteredLocationHistory = unfilteredLocationHistory;

  factory _$_TripArchive.fromJson(Map<String, dynamic> json) =>
      _$$_TripArchiveFromJson(json);

  final List<TripSegment> _tripSegments;
  @override
  @JsonKey()
  List<TripSegment> get tripSegments {
    if (_tripSegments is EqualUnmodifiableListView) return _tripSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tripSegments);
  }

  @override
  final String? tripName;
  @override
  final HikeMetrics? hikeMetrics;
  final List<LocationStatus> _locationHistory;
  @override
  @JsonKey()
  List<LocationStatus> get locationHistory {
    if (_locationHistory is EqualUnmodifiableListView) return _locationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationHistory);
  }

  final List<LocationStatus> _unfilteredLocationHistory;
  @override
  @JsonKey()
  List<LocationStatus> get unfilteredLocationHistory {
    if (_unfilteredLocationHistory is EqualUnmodifiableListView)
      return _unfilteredLocationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unfilteredLocationHistory);
  }

  @override
  final PlotValues? elevationPlot;
  @override
  final PlotValues? speedPlot;

  @override
  String toString() {
    return 'TripArchive(tripSegments: $tripSegments, tripName: $tripName, hikeMetrics: $hikeMetrics, locationHistory: $locationHistory, unfilteredLocationHistory: $unfilteredLocationHistory, elevationPlot: $elevationPlot, speedPlot: $speedPlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripArchive &&
            const DeepCollectionEquality()
                .equals(other._tripSegments, _tripSegments) &&
            (identical(other.tripName, tripName) ||
                other.tripName == tripName) &&
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
      const DeepCollectionEquality().hash(_tripSegments),
      tripName,
      hikeMetrics,
      const DeepCollectionEquality().hash(_locationHistory),
      const DeepCollectionEquality().hash(_unfilteredLocationHistory),
      elevationPlot,
      speedPlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripArchiveCopyWith<_$_TripArchive> get copyWith =>
      __$$_TripArchiveCopyWithImpl<_$_TripArchive>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripArchiveToJson(
      this,
    );
  }
}

abstract class _TripArchive implements TripArchive {
  const factory _TripArchive(
      {final List<TripSegment> tripSegments,
      final String? tripName,
      final HikeMetrics? hikeMetrics,
      final List<LocationStatus> locationHistory,
      final List<LocationStatus> unfilteredLocationHistory,
      final PlotValues? elevationPlot,
      final PlotValues? speedPlot}) = _$_TripArchive;

  factory _TripArchive.fromJson(Map<String, dynamic> json) =
      _$_TripArchive.fromJson;

  @override
  List<TripSegment> get tripSegments;
  @override
  String? get tripName;
  @override
  HikeMetrics? get hikeMetrics;
  @override
  List<LocationStatus> get locationHistory;
  @override
  List<LocationStatus> get unfilteredLocationHistory;
  @override
  PlotValues? get elevationPlot;
  @override
  PlotValues? get speedPlot;
  @override
  @JsonKey(ignore: true)
  _$$_TripArchiveCopyWith<_$_TripArchive> get copyWith =>
      throw _privateConstructorUsedError;
}

TripSegment _$TripSegmentFromJson(Map<String, dynamic> json) {
  return _TripSegment.fromJson(json);
}

/// @nodoc
mixin _$TripSegment {
  HikeMetrics? get hikeMetrics => throw _privateConstructorUsedError;
  List<LocationStatus> get locationHistory =>
      throw _privateConstructorUsedError;
  List<LocationStatus> get unfilteredLocationHistory =>
      throw _privateConstructorUsedError;
  PlotValues? get elevationPlot => throw _privateConstructorUsedError;
  PlotValues? get speedPlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripSegmentCopyWith<TripSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripSegmentCopyWith<$Res> {
  factory $TripSegmentCopyWith(
          TripSegment value, $Res Function(TripSegment) then) =
      _$TripSegmentCopyWithImpl<$Res, TripSegment>;
  @useResult
  $Res call(
      {HikeMetrics? hikeMetrics,
      List<LocationStatus> locationHistory,
      List<LocationStatus> unfilteredLocationHistory,
      PlotValues? elevationPlot,
      PlotValues? speedPlot});

  $HikeMetricsCopyWith<$Res>? get hikeMetrics;
  $PlotValuesCopyWith<$Res>? get elevationPlot;
  $PlotValuesCopyWith<$Res>? get speedPlot;
}

/// @nodoc
class _$TripSegmentCopyWithImpl<$Res, $Val extends TripSegment>
    implements $TripSegmentCopyWith<$Res> {
  _$TripSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = null,
    Object? unfilteredLocationHistory = null,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_value.copyWith(
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: null == locationHistory
          ? _value.locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
      unfilteredLocationHistory: null == unfilteredLocationHistory
          ? _value.unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
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
abstract class _$$_TripSegmentCopyWith<$Res>
    implements $TripSegmentCopyWith<$Res> {
  factory _$$_TripSegmentCopyWith(
          _$_TripSegment value, $Res Function(_$_TripSegment) then) =
      __$$_TripSegmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HikeMetrics? hikeMetrics,
      List<LocationStatus> locationHistory,
      List<LocationStatus> unfilteredLocationHistory,
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
class __$$_TripSegmentCopyWithImpl<$Res>
    extends _$TripSegmentCopyWithImpl<$Res, _$_TripSegment>
    implements _$$_TripSegmentCopyWith<$Res> {
  __$$_TripSegmentCopyWithImpl(
      _$_TripSegment _value, $Res Function(_$_TripSegment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hikeMetrics = freezed,
    Object? locationHistory = null,
    Object? unfilteredLocationHistory = null,
    Object? elevationPlot = freezed,
    Object? speedPlot = freezed,
  }) {
    return _then(_$_TripSegment(
      hikeMetrics: freezed == hikeMetrics
          ? _value.hikeMetrics
          : hikeMetrics // ignore: cast_nullable_to_non_nullable
              as HikeMetrics?,
      locationHistory: null == locationHistory
          ? _value._locationHistory
          : locationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
      unfilteredLocationHistory: null == unfilteredLocationHistory
          ? _value._unfilteredLocationHistory
          : unfilteredLocationHistory // ignore: cast_nullable_to_non_nullable
              as List<LocationStatus>,
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
class _$_TripSegment implements _TripSegment {
  const _$_TripSegment(
      {this.hikeMetrics,
      final List<LocationStatus> locationHistory = const [],
      final List<LocationStatus> unfilteredLocationHistory = const [],
      this.elevationPlot,
      this.speedPlot})
      : _locationHistory = locationHistory,
        _unfilteredLocationHistory = unfilteredLocationHistory;

  factory _$_TripSegment.fromJson(Map<String, dynamic> json) =>
      _$$_TripSegmentFromJson(json);

  @override
  final HikeMetrics? hikeMetrics;
  final List<LocationStatus> _locationHistory;
  @override
  @JsonKey()
  List<LocationStatus> get locationHistory {
    if (_locationHistory is EqualUnmodifiableListView) return _locationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationHistory);
  }

  final List<LocationStatus> _unfilteredLocationHistory;
  @override
  @JsonKey()
  List<LocationStatus> get unfilteredLocationHistory {
    if (_unfilteredLocationHistory is EqualUnmodifiableListView)
      return _unfilteredLocationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unfilteredLocationHistory);
  }

  @override
  final PlotValues? elevationPlot;
  @override
  final PlotValues? speedPlot;

  @override
  String toString() {
    return 'TripSegment(hikeMetrics: $hikeMetrics, locationHistory: $locationHistory, unfilteredLocationHistory: $unfilteredLocationHistory, elevationPlot: $elevationPlot, speedPlot: $speedPlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripSegment &&
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
  _$$_TripSegmentCopyWith<_$_TripSegment> get copyWith =>
      __$$_TripSegmentCopyWithImpl<_$_TripSegment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripSegmentToJson(
      this,
    );
  }
}

abstract class _TripSegment implements TripSegment {
  const factory _TripSegment(
      {final HikeMetrics? hikeMetrics,
      final List<LocationStatus> locationHistory,
      final List<LocationStatus> unfilteredLocationHistory,
      final PlotValues? elevationPlot,
      final PlotValues? speedPlot}) = _$_TripSegment;

  factory _TripSegment.fromJson(Map<String, dynamic> json) =
      _$_TripSegment.fromJson;

  @override
  HikeMetrics? get hikeMetrics;
  @override
  List<LocationStatus> get locationHistory;
  @override
  List<LocationStatus> get unfilteredLocationHistory;
  @override
  PlotValues? get elevationPlot;
  @override
  PlotValues? get speedPlot;
  @override
  @JsonKey(ignore: true)
  _$$_TripSegmentCopyWith<_$_TripSegment> get copyWith =>
      throw _privateConstructorUsedError;
}
