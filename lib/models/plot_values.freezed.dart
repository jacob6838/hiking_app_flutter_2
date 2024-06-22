// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plot_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlotValues _$PlotValuesFromJson(Map<String, dynamic> json) {
  return _PlotValues.fromJson(json);
}

/// @nodoc
mixin _$PlotValues {
  List<List<double>> get values => throw _privateConstructorUsedError;
  PlotFormat get xFormat => throw _privateConstructorUsedError;
  PlotFormat get yFormat => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlotValuesCopyWith<PlotValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotValuesCopyWith<$Res> {
  factory $PlotValuesCopyWith(
          PlotValues value, $Res Function(PlotValues) then) =
      _$PlotValuesCopyWithImpl<$Res, PlotValues>;
  @useResult
  $Res call(
      {List<List<double>> values,
      PlotFormat xFormat,
      PlotFormat yFormat,
      double height,
      double width});

  $PlotFormatCopyWith<$Res> get xFormat;
  $PlotFormatCopyWith<$Res> get yFormat;
}

/// @nodoc
class _$PlotValuesCopyWithImpl<$Res, $Val extends PlotValues>
    implements $PlotValuesCopyWith<$Res> {
  _$PlotValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? xFormat = null,
    Object? yFormat = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      xFormat: null == xFormat
          ? _value.xFormat
          : xFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      yFormat: null == yFormat
          ? _value.yFormat
          : yFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlotFormatCopyWith<$Res> get xFormat {
    return $PlotFormatCopyWith<$Res>(_value.xFormat, (value) {
      return _then(_value.copyWith(xFormat: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlotFormatCopyWith<$Res> get yFormat {
    return $PlotFormatCopyWith<$Res>(_value.yFormat, (value) {
      return _then(_value.copyWith(yFormat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlotValuesImplCopyWith<$Res>
    implements $PlotValuesCopyWith<$Res> {
  factory _$$PlotValuesImplCopyWith(
          _$PlotValuesImpl value, $Res Function(_$PlotValuesImpl) then) =
      __$$PlotValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<double>> values,
      PlotFormat xFormat,
      PlotFormat yFormat,
      double height,
      double width});

  @override
  $PlotFormatCopyWith<$Res> get xFormat;
  @override
  $PlotFormatCopyWith<$Res> get yFormat;
}

/// @nodoc
class __$$PlotValuesImplCopyWithImpl<$Res>
    extends _$PlotValuesCopyWithImpl<$Res, _$PlotValuesImpl>
    implements _$$PlotValuesImplCopyWith<$Res> {
  __$$PlotValuesImplCopyWithImpl(
      _$PlotValuesImpl _value, $Res Function(_$PlotValuesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? xFormat = null,
    Object? yFormat = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_$PlotValuesImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      xFormat: null == xFormat
          ? _value.xFormat
          : xFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      yFormat: null == yFormat
          ? _value.yFormat
          : yFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlotValuesImpl implements _PlotValues {
  const _$PlotValuesImpl(
      {required final List<List<double>> values,
      required this.xFormat,
      required this.yFormat,
      required this.height,
      required this.width})
      : _values = values;

  factory _$PlotValuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlotValuesImplFromJson(json);

  final List<List<double>> _values;
  @override
  List<List<double>> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final PlotFormat xFormat;
  @override
  final PlotFormat yFormat;
  @override
  final double height;
  @override
  final double width;

  @override
  String toString() {
    return 'PlotValues._(values: $values, xFormat: $xFormat, yFormat: $yFormat, height: $height, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlotValuesImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.xFormat, xFormat) || other.xFormat == xFormat) &&
            (identical(other.yFormat, yFormat) || other.yFormat == yFormat) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_values),
      xFormat,
      yFormat,
      height,
      width);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlotValuesImplCopyWith<_$PlotValuesImpl> get copyWith =>
      __$$PlotValuesImplCopyWithImpl<_$PlotValuesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlotValuesImplToJson(
      this,
    );
  }
}

abstract class _PlotValues implements PlotValues {
  const factory _PlotValues(
      {required final List<List<double>> values,
      required final PlotFormat xFormat,
      required final PlotFormat yFormat,
      required final double height,
      required final double width}) = _$PlotValuesImpl;

  factory _PlotValues.fromJson(Map<String, dynamic> json) =
      _$PlotValuesImpl.fromJson;

  @override
  List<List<double>> get values;
  @override
  PlotFormat get xFormat;
  @override
  PlotFormat get yFormat;
  @override
  double get height;
  @override
  double get width;
  @override
  @JsonKey(ignore: true)
  _$$PlotValuesImplCopyWith<_$PlotValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlotFormat _$PlotFormatFromJson(Map<String, dynamic> json) {
  return _PlotFormat.fromJson(json);
}

/// @nodoc
mixin _$PlotFormat {
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  String? get axisTitle =>
      throw _privateConstructorUsedError; // AxisFormat axisFormatFunc,
  double? get interval => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlotFormatCopyWith<PlotFormat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotFormatCopyWith<$Res> {
  factory $PlotFormatCopyWith(
          PlotFormat value, $Res Function(PlotFormat) then) =
      _$PlotFormatCopyWithImpl<$Res, PlotFormat>;
  @useResult
  $Res call({double? min, double? max, String? axisTitle, double? interval});
}

/// @nodoc
class _$PlotFormatCopyWithImpl<$Res, $Val extends PlotFormat>
    implements $PlotFormatCopyWith<$Res> {
  _$PlotFormatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? axisTitle = freezed,
    Object? interval = freezed,
  }) {
    return _then(_value.copyWith(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      axisTitle: freezed == axisTitle
          ? _value.axisTitle
          : axisTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlotFormatImplCopyWith<$Res>
    implements $PlotFormatCopyWith<$Res> {
  factory _$$PlotFormatImplCopyWith(
          _$PlotFormatImpl value, $Res Function(_$PlotFormatImpl) then) =
      __$$PlotFormatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? min, double? max, String? axisTitle, double? interval});
}

/// @nodoc
class __$$PlotFormatImplCopyWithImpl<$Res>
    extends _$PlotFormatCopyWithImpl<$Res, _$PlotFormatImpl>
    implements _$$PlotFormatImplCopyWith<$Res> {
  __$$PlotFormatImplCopyWithImpl(
      _$PlotFormatImpl _value, $Res Function(_$PlotFormatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? axisTitle = freezed,
    Object? interval = freezed,
  }) {
    return _then(_$PlotFormatImpl(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      axisTitle: freezed == axisTitle
          ? _value.axisTitle
          : axisTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlotFormatImpl implements _PlotFormat {
  const _$PlotFormatImpl({this.min, this.max, this.axisTitle, this.interval});

  factory _$PlotFormatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlotFormatImplFromJson(json);

  @override
  final double? min;
  @override
  final double? max;
  @override
  final String? axisTitle;
// AxisFormat axisFormatFunc,
  @override
  final double? interval;

  @override
  String toString() {
    return 'PlotFormat(min: $min, max: $max, axisTitle: $axisTitle, interval: $interval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlotFormatImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.axisTitle, axisTitle) ||
                other.axisTitle == axisTitle) &&
            (identical(other.interval, interval) ||
                other.interval == interval));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min, max, axisTitle, interval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlotFormatImplCopyWith<_$PlotFormatImpl> get copyWith =>
      __$$PlotFormatImplCopyWithImpl<_$PlotFormatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlotFormatImplToJson(
      this,
    );
  }
}

abstract class _PlotFormat implements PlotFormat {
  const factory _PlotFormat(
      {final double? min,
      final double? max,
      final String? axisTitle,
      final double? interval}) = _$PlotFormatImpl;

  factory _PlotFormat.fromJson(Map<String, dynamic> json) =
      _$PlotFormatImpl.fromJson;

  @override
  double? get min;
  @override
  double? get max;
  @override
  String? get axisTitle;
  @override // AxisFormat axisFormatFunc,
  double? get interval;
  @override
  @JsonKey(ignore: true)
  _$$PlotFormatImplCopyWith<_$PlotFormatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
