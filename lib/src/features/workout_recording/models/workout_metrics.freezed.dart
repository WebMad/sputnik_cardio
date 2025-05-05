// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutMetrics _$WorkoutMetricsFromJson(Map<String, dynamic> json) {
  return _WorkoutMetrics.fromJson(json);
}

/// @nodoc
mixin _$WorkoutMetrics {
  double get kms => throw _privateConstructorUsedError;
  double get avgSpeed => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutMetricsCopyWith<WorkoutMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutMetricsCopyWith<$Res> {
  factory $WorkoutMetricsCopyWith(
          WorkoutMetrics value, $Res Function(WorkoutMetrics) then) =
      _$WorkoutMetricsCopyWithImpl<$Res, WorkoutMetrics>;
  @useResult
  $Res call({double kms, double avgSpeed, double speed});
}

/// @nodoc
class _$WorkoutMetricsCopyWithImpl<$Res, $Val extends WorkoutMetrics>
    implements $WorkoutMetricsCopyWith<$Res> {
  _$WorkoutMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kms = null,
    Object? avgSpeed = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutMetricsImplCopyWith<$Res>
    implements $WorkoutMetricsCopyWith<$Res> {
  factory _$$WorkoutMetricsImplCopyWith(_$WorkoutMetricsImpl value,
          $Res Function(_$WorkoutMetricsImpl) then) =
      __$$WorkoutMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double kms, double avgSpeed, double speed});
}

/// @nodoc
class __$$WorkoutMetricsImplCopyWithImpl<$Res>
    extends _$WorkoutMetricsCopyWithImpl<$Res, _$WorkoutMetricsImpl>
    implements _$$WorkoutMetricsImplCopyWith<$Res> {
  __$$WorkoutMetricsImplCopyWithImpl(
      _$WorkoutMetricsImpl _value, $Res Function(_$WorkoutMetricsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kms = null,
    Object? avgSpeed = null,
    Object? speed = null,
  }) {
    return _then(_$WorkoutMetricsImpl(
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutMetricsImpl
    with DiagnosticableTreeMixin
    implements _WorkoutMetrics {
  const _$WorkoutMetricsImpl(
      {required this.kms, required this.avgSpeed, required this.speed});

  factory _$WorkoutMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutMetricsImplFromJson(json);

  @override
  final double kms;
  @override
  final double avgSpeed;
  @override
  final double speed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkoutMetrics(kms: $kms, avgSpeed: $avgSpeed, speed: $speed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkoutMetrics'))
      ..add(DiagnosticsProperty('kms', kms))
      ..add(DiagnosticsProperty('avgSpeed', avgSpeed))
      ..add(DiagnosticsProperty('speed', speed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutMetricsImpl &&
            (identical(other.kms, kms) || other.kms == kms) &&
            (identical(other.avgSpeed, avgSpeed) ||
                other.avgSpeed == avgSpeed) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kms, avgSpeed, speed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutMetricsImplCopyWith<_$WorkoutMetricsImpl> get copyWith =>
      __$$WorkoutMetricsImplCopyWithImpl<_$WorkoutMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutMetricsImplToJson(
      this,
    );
  }
}

abstract class _WorkoutMetrics implements WorkoutMetrics {
  const factory _WorkoutMetrics(
      {required final double kms,
      required final double avgSpeed,
      required final double speed}) = _$WorkoutMetricsImpl;

  factory _WorkoutMetrics.fromJson(Map<String, dynamic> json) =
      _$WorkoutMetricsImpl.fromJson;

  @override
  double get kms;
  @override
  double get avgSpeed;
  @override
  double get speed;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutMetricsImplCopyWith<_$WorkoutMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
