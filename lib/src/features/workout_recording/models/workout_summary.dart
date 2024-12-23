import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_metrics.dart';

import 'workout.dart';

part 'workout_summary.freezed.dart';

part 'workout_summary.g.dart';

@freezed
class WorkoutSummary with _$WorkoutSummary {
  const factory WorkoutSummary({
    required Workout workout,
    required WorkoutMetrics metrics,
  }) = _WorkoutSummary;

  factory WorkoutSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSummaryFromJson(json);
}
