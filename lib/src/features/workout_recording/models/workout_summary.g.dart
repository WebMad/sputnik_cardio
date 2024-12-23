// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSummaryImpl _$$WorkoutSummaryImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSummaryImpl(
      workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
      metrics: WorkoutMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkoutSummaryImplToJson(
        _$WorkoutSummaryImpl instance) =>
    <String, dynamic>{
      'workout': instance.workout,
      'metrics': instance.metrics,
    };
