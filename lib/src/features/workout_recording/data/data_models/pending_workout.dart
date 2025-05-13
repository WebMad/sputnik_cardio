import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';

import '../../../workout_metrics/models/workout_metrics.dart';

part 'pending_workout.freezed.dart';

part 'pending_workout.g.dart';

@freezed
class PendingWorkout with _$PendingWorkout {
  const factory PendingWorkout({
    required Workout workout,
    required List<WorkoutRoute> routes,
    required WorkoutMetrics workoutMetrics,
  }) = _PendingWorkout;

  factory PendingWorkout.fromJson(Map<String, dynamic> json) =>
      _$PendingWorkoutFromJson(json);
}
