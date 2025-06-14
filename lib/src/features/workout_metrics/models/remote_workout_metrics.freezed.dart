// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_workout_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteWorkoutMetrics _$RemoteWorkoutMetricsFromJson(Map<String, dynamic> json) {
  return _RemoteWorkoutMetrics.fromJson(json);
}

/// @nodoc
mixin _$RemoteWorkoutMetrics {
  @JsonKey(name: 'kms')
  double get kms => throw _privateConstructorUsedError;
  @JsonKey(name: 'pace_ms')
  int get paceMs => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_speed')
  double get avgSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_ms')
  int get durationMs => throw _privateConstructorUsedError;
  @JsonKey(name: 'workout_uuid')
  String get workoutUuid => throw _privateConstructorUsedError;

  /// Serializes this RemoteWorkoutMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteWorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteWorkoutMetricsCopyWith<RemoteWorkoutMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteWorkoutMetricsCopyWith<$Res> {
  factory $RemoteWorkoutMetricsCopyWith(RemoteWorkoutMetrics value,
          $Res Function(RemoteWorkoutMetrics) then) =
      _$RemoteWorkoutMetricsCopyWithImpl<$Res, RemoteWorkoutMetrics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kms') double kms,
      @JsonKey(name: 'pace_ms') int paceMs,
      @JsonKey(name: 'avg_speed') double avgSpeed,
      @JsonKey(name: 'duration_ms') int durationMs,
      @JsonKey(name: 'workout_uuid') String workoutUuid});
}

/// @nodoc
class _$RemoteWorkoutMetricsCopyWithImpl<$Res,
        $Val extends RemoteWorkoutMetrics>
    implements $RemoteWorkoutMetricsCopyWith<$Res> {
  _$RemoteWorkoutMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteWorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kms = null,
    Object? paceMs = null,
    Object? avgSpeed = null,
    Object? durationMs = null,
    Object? workoutUuid = null,
  }) {
    return _then(_value.copyWith(
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      paceMs: null == paceMs
          ? _value.paceMs
          : paceMs // ignore: cast_nullable_to_non_nullable
              as int,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      workoutUuid: null == workoutUuid
          ? _value.workoutUuid
          : workoutUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteWorkoutMetricsImplCopyWith<$Res>
    implements $RemoteWorkoutMetricsCopyWith<$Res> {
  factory _$$RemoteWorkoutMetricsImplCopyWith(_$RemoteWorkoutMetricsImpl value,
          $Res Function(_$RemoteWorkoutMetricsImpl) then) =
      __$$RemoteWorkoutMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kms') double kms,
      @JsonKey(name: 'pace_ms') int paceMs,
      @JsonKey(name: 'avg_speed') double avgSpeed,
      @JsonKey(name: 'duration_ms') int durationMs,
      @JsonKey(name: 'workout_uuid') String workoutUuid});
}

/// @nodoc
class __$$RemoteWorkoutMetricsImplCopyWithImpl<$Res>
    extends _$RemoteWorkoutMetricsCopyWithImpl<$Res, _$RemoteWorkoutMetricsImpl>
    implements _$$RemoteWorkoutMetricsImplCopyWith<$Res> {
  __$$RemoteWorkoutMetricsImplCopyWithImpl(_$RemoteWorkoutMetricsImpl _value,
      $Res Function(_$RemoteWorkoutMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteWorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kms = null,
    Object? paceMs = null,
    Object? avgSpeed = null,
    Object? durationMs = null,
    Object? workoutUuid = null,
  }) {
    return _then(_$RemoteWorkoutMetricsImpl(
      kms: null == kms
          ? _value.kms
          : kms // ignore: cast_nullable_to_non_nullable
              as double,
      paceMs: null == paceMs
          ? _value.paceMs
          : paceMs // ignore: cast_nullable_to_non_nullable
              as int,
      avgSpeed: null == avgSpeed
          ? _value.avgSpeed
          : avgSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      workoutUuid: null == workoutUuid
          ? _value.workoutUuid
          : workoutUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteWorkoutMetricsImpl implements _RemoteWorkoutMetrics {
  const _$RemoteWorkoutMetricsImpl(
      {@JsonKey(name: 'kms') required this.kms,
      @JsonKey(name: 'pace_ms') required this.paceMs,
      @JsonKey(name: 'avg_speed') required this.avgSpeed,
      @JsonKey(name: 'duration_ms') required this.durationMs,
      @JsonKey(name: 'workout_uuid') required this.workoutUuid});

  factory _$RemoteWorkoutMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteWorkoutMetricsImplFromJson(json);

  @override
  @JsonKey(name: 'kms')
  final double kms;
  @override
  @JsonKey(name: 'pace_ms')
  final int paceMs;
  @override
  @JsonKey(name: 'avg_speed')
  final double avgSpeed;
  @override
  @JsonKey(name: 'duration_ms')
  final int durationMs;
  @override
  @JsonKey(name: 'workout_uuid')
  final String workoutUuid;

  @override
  String toString() {
    return 'RemoteWorkoutMetrics(kms: $kms, paceMs: $paceMs, avgSpeed: $avgSpeed, durationMs: $durationMs, workoutUuid: $workoutUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteWorkoutMetricsImpl &&
            (identical(other.kms, kms) || other.kms == kms) &&
            (identical(other.paceMs, paceMs) || other.paceMs == paceMs) &&
            (identical(other.avgSpeed, avgSpeed) ||
                other.avgSpeed == avgSpeed) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.workoutUuid, workoutUuid) ||
                other.workoutUuid == workoutUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kms, paceMs, avgSpeed, durationMs, workoutUuid);

  /// Create a copy of RemoteWorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteWorkoutMetricsImplCopyWith<_$RemoteWorkoutMetricsImpl>
      get copyWith =>
          __$$RemoteWorkoutMetricsImplCopyWithImpl<_$RemoteWorkoutMetricsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteWorkoutMetricsImplToJson(
      this,
    );
  }
}

abstract class _RemoteWorkoutMetrics implements RemoteWorkoutMetrics {
  const factory _RemoteWorkoutMetrics(
          {@JsonKey(name: 'kms') required final double kms,
          @JsonKey(name: 'pace_ms') required final int paceMs,
          @JsonKey(name: 'avg_speed') required final double avgSpeed,
          @JsonKey(name: 'duration_ms') required final int durationMs,
          @JsonKey(name: 'workout_uuid') required final String workoutUuid}) =
      _$RemoteWorkoutMetricsImpl;

  factory _RemoteWorkoutMetrics.fromJson(Map<String, dynamic> json) =
      _$RemoteWorkoutMetricsImpl.fromJson;

  @override
  @JsonKey(name: 'kms')
  double get kms;
  @override
  @JsonKey(name: 'pace_ms')
  int get paceMs;
  @override
  @JsonKey(name: 'avg_speed')
  double get avgSpeed;
  @override
  @JsonKey(name: 'duration_ms')
  int get durationMs;
  @override
  @JsonKey(name: 'workout_uuid')
  String get workoutUuid;

  /// Create a copy of RemoteWorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteWorkoutMetricsImplCopyWith<_$RemoteWorkoutMetricsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
