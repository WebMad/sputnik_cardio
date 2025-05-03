import 'package:freezed_annotation/freezed_annotation.dart';

import 'workout_segment.dart';

part 'workout.freezed.dart';

part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    @JsonKey(name: 'uuid') required String uuid,
    @JsonKey(name: 'start_at') required DateTime startAt,
    @JsonKey(name: 'stop_at') DateTime? stopAt,
    @JsonKey(name: 'state') required WorkoutState state,
    @JsonKey(name: 'segments') @Default([]) List<WorkoutSegment> segments,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

extension WorkoutEx on Workout {
  WorkoutSegment? get lastSegment => segments.lastOrNull;
}

enum WorkoutState {
  idle,
  inProcess,
  paused,
  stopped,
}
