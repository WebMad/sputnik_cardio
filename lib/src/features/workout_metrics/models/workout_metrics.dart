import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/remote_workout_metrics.dart';

part 'workout_metrics.freezed.dart';

part 'workout_metrics.g.dart';

@freezed
class WorkoutMetrics with _$WorkoutMetrics {
  const factory WorkoutMetrics({
    required Duration pace,
    required Duration paceLastKm,
    required double kms,
    required double avgSpeed,
    required double speed,
    required Duration duration,
    // @JsonKey(name: 'workout_id') required int workoutId,
  }) = _WorkoutMetrics;

  factory WorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$WorkoutMetricsFromJson(json);
}
