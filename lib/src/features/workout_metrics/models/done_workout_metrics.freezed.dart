// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'done_workout_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoneWorkoutMetrics _$DoneWorkoutMetricsFromJson(Map<String, dynamic> json) {
  return _DoneWorkoutMetrics.fromJson(json);
}

/// @nodoc
mixin _$DoneWorkoutMetrics {
  Duration get pace => throw _privateConstructorUsedError;
  double get kms => throw _privateConstructorUsedError;
  double get avgSpeed => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoneWorkoutMetricsCopyWith<DoneWorkoutMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneWorkoutMetricsCopyWith<$Res> {
  factory $DoneWorkoutMetricsCopyWith(
          DoneWorkoutMetrics value, $Res Function(DoneWorkoutMetrics) then) =
      _$DoneWorkoutMetricsCopyWithImpl<$Res, DoneWorkoutMetrics>;
  @useResult
  $Res call({Duration pace, double kms, double avgSpeed, Duration duration});
}

/// @nodoc
class _$DoneWorkoutMetricsCopyWithImpl<$Res, $Val extends DoneWorkoutMetrics>
    implements $DoneWorkoutMetricsCopyWith<$Res> {
  _$DoneWorkoutMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pace = null,
    Object? kms = null,
    Object? avgSpeed = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as Duration,
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoneWorkoutMetricsImplCopyWith<$Res>
    implements $DoneWorkoutMetricsCopyWith<$Res> {
  factory _$$DoneWorkoutMetricsImplCopyWith(_$DoneWorkoutMetricsImpl value,
          $Res Function(_$DoneWorkoutMetricsImpl) then) =
      __$$DoneWorkoutMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration pace, double kms, double avgSpeed, Duration duration});
}

/// @nodoc
class __$$DoneWorkoutMetricsImplCopyWithImpl<$Res>
    extends _$DoneWorkoutMetricsCopyWithImpl<$Res, _$DoneWorkoutMetricsImpl>
    implements _$$DoneWorkoutMetricsImplCopyWith<$Res> {
  __$$DoneWorkoutMetricsImplCopyWithImpl(_$DoneWorkoutMetricsImpl _value,
      $Res Function(_$DoneWorkoutMetricsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pace = null,
    Object? kms = null,
    Object? avgSpeed = null,
    Object? duration = null,
  }) {
    return _then(_$DoneWorkoutMetricsImpl(
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as Duration,
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
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
class _$DoneWorkoutMetricsImpl implements _DoneWorkoutMetrics {
  const _$DoneWorkoutMetricsImpl(
      {required this.pace,
      required this.kms,
      required this.avgSpeed,
      required this.duration});

  factory _$DoneWorkoutMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoneWorkoutMetricsImplFromJson(json);

  @override
  final Duration pace;
  @override
  final double kms;
  @override
  final double avgSpeed;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'DoneWorkoutMetrics(pace: $pace, kms: $kms, avgSpeed: $avgSpeed, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneWorkoutMetricsImpl &&
            (identical(other.pace, pace) || other.pace == pace) &&
            (identical(other.kms, kms) || other.kms == kms) &&
            (identical(other.avgSpeed, avgSpeed) ||
                other.avgSpeed == avgSpeed) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pace, kms, avgSpeed, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneWorkoutMetricsImplCopyWith<_$DoneWorkoutMetricsImpl> get copyWith =>
      __$$DoneWorkoutMetricsImplCopyWithImpl<_$DoneWorkoutMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoneWorkoutMetricsImplToJson(
      this,
    );
  }
}

abstract class _DoneWorkoutMetrics implements DoneWorkoutMetrics {
  const factory _DoneWorkoutMetrics(
      {required final Duration pace,
      required final double kms,
      required final double avgSpeed,
      required final Duration duration}) = _$DoneWorkoutMetricsImpl;

  factory _DoneWorkoutMetrics.fromJson(Map<String, dynamic> json) =
      _$DoneWorkoutMetricsImpl.fromJson;

  @override
  Duration get pace;
  @override
  double get kms;
  @override
  double get avgSpeed;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$DoneWorkoutMetricsImplCopyWith<_$DoneWorkoutMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
