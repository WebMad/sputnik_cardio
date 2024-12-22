import '../../tracking/models/pos.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'start_pos') required Pos startPos,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'status') required WorkoutState status,
    @JsonKey(name: 'end_pos') Pos? endPos,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'start_at') DateTime? startAt,
    @JsonKey(name: 'stop_at') DateTime? stopAt,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

enum WorkoutState {
  started,
  paused,
  stopped,
}
