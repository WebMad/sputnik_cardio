import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_route.dart';

import '../../../workout_managing/models/workout.dart';

part 'pending_workout.freezed.dart';

part 'pending_workout.g.dart';

@freezed
class PendingWorkout with _$PendingWorkout {
  const factory PendingWorkout({
    required Workout workout,
    required List<WorkoutRoute> routes,
  }) = _PendingWorkout;

  factory PendingWorkout.fromJson(Map<String, dynamic> json) =>
      _$PendingWorkoutFromJson(json);
}
