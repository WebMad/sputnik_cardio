import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_metrics.freezed.dart';

part 'workout_metrics.g.dart';

@freezed
class WorkoutMetrics with _$WorkoutMetrics {
  const factory WorkoutMetrics({
    required double kms,
    required double avgSpeed,
    // @JsonKey(name: 'workout_id') required int workoutId,
  }) = _WorkoutMetrics;

  factory WorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$WorkoutMetricsFromJson(json);
}
