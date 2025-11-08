// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteWorkoutMetricsImpl _$$RemoteWorkoutMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteWorkoutMetricsImpl(
      kms: (json['kms'] as num).toDouble(),
      paceMs: (json['pace_ms'] as num).toInt(),
      avgSpeed: (json['avg_speed'] as num).toDouble(),
      durationMs: (json['duration_ms'] as num).toInt(),
      workoutUuid: json['workout_uuid'] as String,
    );

Map<String, dynamic> _$$RemoteWorkoutMetricsImplToJson(
        _$RemoteWorkoutMetricsImpl instance) =>
    <String, dynamic>{
      'kms': instance.kms,
      'pace_ms': instance.paceMs,
      'avg_speed': instance.avgSpeed,
      'duration_ms': instance.durationMs,
      'workout_uuid': instance.workoutUuid,
    };
