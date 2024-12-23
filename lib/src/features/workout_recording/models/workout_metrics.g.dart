// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutMetricsImpl _$$WorkoutMetricsImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutMetricsImpl(
      kms: (json['kms'] as num).toDouble(),
      avgSpeed: (json['avg_speed'] as num).toDouble(),
      workoutId: (json['workout_id'] as num).toInt(),
    );

Map<String, dynamic> _$$WorkoutMetricsImplToJson(
        _$WorkoutMetricsImpl instance) =>
    <String, dynamic>{
      'kms': instance.kms,
      'avg_speed': instance.avgSpeed,
      'workout_id': instance.workoutId,
    };
