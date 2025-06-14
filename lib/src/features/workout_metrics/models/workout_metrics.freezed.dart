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
  Duration get pace => throw _privateConstructorUsedError;
  Duration get paceLastKm => throw _privateConstructorUsedError;
  double get kms => throw _privateConstructorUsedError;
  double get avgSpeed => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Serializes this WorkoutMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutMetricsCopyWith<WorkoutMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutMetricsCopyWith<$Res> {
  factory $WorkoutMetricsCopyWith(
          WorkoutMetrics value, $Res Function(WorkoutMetrics) then) =
      _$WorkoutMetricsCopyWithImpl<$Res, WorkoutMetrics>;
  @useResult
  $Res call(
      {Duration pace,
      Duration paceLastKm,
      double kms,
      double avgSpeed,
      double speed,
      Duration duration});
}

/// @nodoc
class _$WorkoutMetricsCopyWithImpl<$Res, $Val extends WorkoutMetrics>
    implements $WorkoutMetricsCopyWith<$Res> {
  _$WorkoutMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pace = null,
    Object? paceLastKm = null,
    Object? kms = null,
    Object? avgSpeed = null,
    Object? speed = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as Duration,
      paceLastKm: null == paceLastKm
          ? _value.paceLastKm
          : paceLastKm // ignore: cast_nullable_to_non_nullable
              as Duration,
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
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
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
  $Res call(
      {Duration pace,
      Duration paceLastKm,
      double kms,
      double avgSpeed,
      double speed,
      Duration duration});
}

/// @nodoc
class __$$WorkoutMetricsImplCopyWithImpl<$Res>
    extends _$WorkoutMetricsCopyWithImpl<$Res, _$WorkoutMetricsImpl>
    implements _$$WorkoutMetricsImplCopyWith<$Res> {
  __$$WorkoutMetricsImplCopyWithImpl(
      _$WorkoutMetricsImpl _value, $Res Function(_$WorkoutMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pace = null,
    Object? paceLastKm = null,
    Object? kms = null,
    Object? avgSpeed = null,
    Object? speed = null,
    Object? duration = null,
  }) {
    return _then(_$WorkoutMetricsImpl(
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as Duration,
      paceLastKm: null == paceLastKm
          ? _value.paceLastKm
          : paceLastKm // ignore: cast_nullable_to_non_nullable
              as Duration,
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
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutMetricsImpl
    with DiagnosticableTreeMixin
    implements _WorkoutMetrics {
  const _$WorkoutMetricsImpl(
      {required this.pace,
      required this.paceLastKm,
      required this.kms,
      required this.avgSpeed,
      required this.speed,
      required this.duration});

  factory _$WorkoutMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutMetricsImplFromJson(json);

  @override
  final Duration pace;
  @override
  final Duration paceLastKm;
  @override
  final double kms;
  @override
  final double avgSpeed;
  @override
  final double speed;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkoutMetrics(pace: $pace, paceLastKm: $paceLastKm, kms: $kms, avgSpeed: $avgSpeed, speed: $speed, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkoutMetrics'))
      ..add(DiagnosticsProperty('pace', pace))
      ..add(DiagnosticsProperty('paceLastKm', paceLastKm))
      ..add(DiagnosticsProperty('kms', kms))
      ..add(DiagnosticsProperty('avgSpeed', avgSpeed))
      ..add(DiagnosticsProperty('speed', speed))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutMetricsImpl &&
            (identical(other.pace, pace) || other.pace == pace) &&
            (identical(other.paceLastKm, paceLastKm) ||
                other.paceLastKm == paceLastKm) &&
            (identical(other.kms, kms) || other.kms == kms) &&
            (identical(other.avgSpeed, avgSpeed) ||
                other.avgSpeed == avgSpeed) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pace, paceLastKm, kms, avgSpeed, speed, duration);

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final Duration pace,
      required final Duration paceLastKm,
      required final double kms,
      required final double avgSpeed,
      required final double speed,
      required final Duration duration}) = _$WorkoutMetricsImpl;

  factory _WorkoutMetrics.fromJson(Map<String, dynamic> json) =
      _$WorkoutMetricsImpl.fromJson;

  @override
  Duration get pace;
  @override
  Duration get paceLastKm;
  @override
  double get kms;
  @override
  double get avgSpeed;
  @override
  double get speed;
  @override
  Duration get duration;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutMetricsImplCopyWith<_$WorkoutMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
