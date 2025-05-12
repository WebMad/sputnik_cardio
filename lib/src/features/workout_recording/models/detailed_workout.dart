import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

part 'detailed_workout.freezed.dart';

part 'detailed_workout.g.dart';

@freezed
class DetailedWorkout with _$DetailedWorkout {
  const factory DetailedWorkout({
    required Workout workout,
    required Map<String, List<ExtendedPos>> routes,
  }) = _DetailedWorkout;

  factory DetailedWorkout.fromJson(Map<String, dynamic> json) =>
      _$DetailedWorkoutFromJson(json);
}
