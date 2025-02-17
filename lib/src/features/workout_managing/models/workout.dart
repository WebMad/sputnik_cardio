import 'package:freezed_annotation/freezed_annotation.dart';

import 'workout_segment.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String uuid,
    required WorkoutState state,
    required List<WorkoutSegment> segments,
  }) = _Workout;
}

enum WorkoutState {
  idle,
  inProcess,
  paused,
  stopped,
}
