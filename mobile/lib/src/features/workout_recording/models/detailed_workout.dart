import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/done_workout_metrics.dart';
import 'package:sputnik_location/sputnik_location.dart';

import '../../workout_metrics/models/workout_metrics.dart';

part 'detailed_workout.freezed.dart';

part 'detailed_workout.g.dart';

@freezed
class DetailedWorkout with _$DetailedWorkout {
  const factory DetailedWorkout({
    required Workout workout,
    required Map<String, List<ExtendedPos>> routes,
    required DoneWorkoutMetrics? metrics,
  }) = _DetailedWorkout;

  factory DetailedWorkout.fromJson(Map<String, dynamic> json) =>
      _$DetailedWorkoutFromJson(json);
}
