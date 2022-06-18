// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plot_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlotValues {
  List<List<double>> get values => throw _privateConstructorUsedError;
  PlotFormat get xFormat => throw _privateConstructorUsedError;
  PlotFormat get yFormat => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlotValuesCopyWith<PlotValues> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotValuesCopyWith<$Res> {
  factory $PlotValuesCopyWith(PlotValues value, $Res Function(PlotValues) then) = _$PlotValuesCopyWithImpl<$Res>;
  $Res call({List<List<double>> values, PlotFormat xFormat, PlotFormat yFormat, double height, double width});

  $PlotFormatCopyWith<$Res> get xFormat;
  $PlotFormatCopyWith<$Res> get yFormat;
}

/// @nodoc
class _$PlotValuesCopyWithImpl<$Res> implements $PlotValuesCopyWith<$Res> {
  _$PlotValuesCopyWithImpl(this._value, this._then);

  final PlotValues _value;
  // ignore: unused_field
  final $Res Function(PlotValues) _then;

  @override
  $Res call({
    Object? values = freezed,
    Object? xFormat = freezed,
    Object? yFormat = freezed,
    Object? height = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      xFormat: xFormat == freezed
          ? _value.xFormat
          : xFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      yFormat: yFormat == freezed
          ? _value.yFormat
          : yFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $PlotFormatCopyWith<$Res> get xFormat {
    return $PlotFormatCopyWith<$Res>(_value.xFormat, (value) {
      return _then(_value.copyWith(xFormat: value));
    });
  }

  @override
  $PlotFormatCopyWith<$Res> get yFormat {
    return $PlotFormatCopyWith<$Res>(_value.yFormat, (value) {
      return _then(_value.copyWith(yFormat: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlotValuesCopyWith<$Res> implements $PlotValuesCopyWith<$Res> {
  factory _$$_PlotValuesCopyWith(_$_PlotValues value, $Res Function(_$_PlotValues) then) = __$$_PlotValuesCopyWithImpl<$Res>;
  @override
  $Res call({List<List<double>> values, PlotFormat xFormat, PlotFormat yFormat, double height, double width});

  @override
  $PlotFormatCopyWith<$Res> get xFormat;
  @override
  $PlotFormatCopyWith<$Res> get yFormat;
}

/// @nodoc
class __$$_PlotValuesCopyWithImpl<$Res> extends _$PlotValuesCopyWithImpl<$Res> implements _$$_PlotValuesCopyWith<$Res> {
  __$$_PlotValuesCopyWithImpl(_$_PlotValues _value, $Res Function(_$_PlotValues) _then)
      : super(_value, (v) => _then(v as _$_PlotValues));

  @override
  _$_PlotValues get _value => super._value as _$_PlotValues;

  @override
  $Res call({
    Object? values = freezed,
    Object? xFormat = freezed,
    Object? yFormat = freezed,
    Object? height = freezed,
    Object? width = freezed,
  }) {
    return _then(_$_PlotValues(
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      xFormat: xFormat == freezed
          ? _value.xFormat
          : xFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      yFormat: yFormat == freezed
          ? _value.yFormat
          : yFormat // ignore: cast_nullable_to_non_nullable
              as PlotFormat,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlotValues implements _PlotValues {
  const _$_PlotValues(
      {required final List<List<double>> values,
      required this.xFormat,
      required this.yFormat,
      required this.height,
      required this.width})
      : _values = values;

  factory _$_PlotValues.fromJson(Map<String, dynamic> json) => _$$_PlotValuesFromJson(json);

  final List<List<double>> _values;
  @override
  List<List<double>> get values {
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlotValues &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(other.xFormat, xFormat) &&
            const DeepCollectionEquality().equals(other.yFormat, yFormat) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.width, width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_values),
      const DeepCollectionEquality().hash(xFormat),
      const DeepCollectionEquality().hash(yFormat),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(width));

  @JsonKey(ignore: true)
  @override
  _$$_PlotValuesCopyWith<_$_PlotValues> get copyWith => __$$_PlotValuesCopyWithImpl<_$_PlotValues>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlotValuesToJson(this);
  }
}

abstract class _PlotValues implements PlotValues {
  const factory _PlotValues(
      {required final List<List<double>> values,
      required final PlotFormat xFormat,
      required final PlotFormat yFormat,
      required final double height,
      required final double width}) = _$_PlotValues;

  factory _PlotValues.fromJson(Map<String, dynamic> json) = _$_PlotValues.fromJson;

  @override
  List<List<double>> get values => throw _privateConstructorUsedError;
  @override
  PlotFormat get xFormat => throw _privateConstructorUsedError;
  @override
  PlotFormat get yFormat => throw _privateConstructorUsedError;
  @override
  double get height => throw _privateConstructorUsedError;
  @override
  double get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PlotValuesCopyWith<_$_PlotValues> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlotFormat {
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  String? get axisTitle => throw _privateConstructorUsedError; // AxisFormat axisFormatFunc,
  double? get interval => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlotFormatCopyWith<PlotFormat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotFormatCopyWith<$Res> {
  factory $PlotFormatCopyWith(PlotFormat value, $Res Function(PlotFormat) then) = _$PlotFormatCopyWithImpl<$Res>;
  $Res call({double? min, double? max, String? axisTitle, double? interval});
}

/// @nodoc
class _$PlotFormatCopyWithImpl<$Res> implements $PlotFormatCopyWith<$Res> {
  _$PlotFormatCopyWithImpl(this._value, this._then);

  final PlotFormat _value;
  // ignore: unused_field
  final $Res Function(PlotFormat) _then;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? axisTitle = freezed,
    Object? interval = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      axisTitle: axisTitle == freezed
          ? _value.axisTitle
          : axisTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlotFormatCopyWith<$Res> implements $PlotFormatCopyWith<$Res> {
  factory _$$_PlotFormatCopyWith(_$_PlotFormat value, $Res Function(_$_PlotFormat) then) = __$$_PlotFormatCopyWithImpl<$Res>;
  @override
  $Res call({double? min, double? max, String? axisTitle, double? interval});
}

/// @nodoc
class __$$_PlotFormatCopyWithImpl<$Res> extends _$PlotFormatCopyWithImpl<$Res> implements _$$_PlotFormatCopyWith<$Res> {
  __$$_PlotFormatCopyWithImpl(_$_PlotFormat _value, $Res Function(_$_PlotFormat) _then)
      : super(_value, (v) => _then(v as _$_PlotFormat));

  @override
  _$_PlotFormat get _value => super._value as _$_PlotFormat;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? axisTitle = freezed,
    Object? interval = freezed,
  }) {
    return _then(_$_PlotFormat(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      axisTitle: axisTitle == freezed
          ? _value.axisTitle
          : axisTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlotFormat implements _PlotFormat {
  const _$_PlotFormat({this.min, this.max, this.axisTitle, this.interval});

  factory _$_PlotFormat.fromJson(Map<String, dynamic> json) => _$$_PlotFormatFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlotFormat &&
            const DeepCollectionEquality().equals(other.min, min) &&
            const DeepCollectionEquality().equals(other.max, max) &&
            const DeepCollectionEquality().equals(other.axisTitle, axisTitle) &&
            const DeepCollectionEquality().equals(other.interval, interval));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(min), const DeepCollectionEquality().hash(max),
      const DeepCollectionEquality().hash(axisTitle), const DeepCollectionEquality().hash(interval));

  @JsonKey(ignore: true)
  @override
  _$$_PlotFormatCopyWith<_$_PlotFormat> get copyWith => __$$_PlotFormatCopyWithImpl<_$_PlotFormat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlotFormatToJson(this);
  }
}

abstract class _PlotFormat implements PlotFormat {
  const factory _PlotFormat({final double? min, final double? max, final String? axisTitle, final double? interval}) =
      _$_PlotFormat;

  factory _PlotFormat.fromJson(Map<String, dynamic> json) = _$_PlotFormat.fromJson;

  @override
  double? get min => throw _privateConstructorUsedError;
  @override
  double? get max => throw _privateConstructorUsedError;
  @override
  String? get axisTitle => throw _privateConstructorUsedError;
  @override // AxisFormat axisFormatFunc,
  double? get interval => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PlotFormatCopyWith<_$_PlotFormat> get copyWith => throw _privateConstructorUsedError;
}
