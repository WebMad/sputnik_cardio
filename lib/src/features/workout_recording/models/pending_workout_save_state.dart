import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_workout_save_state.freezed.dart';

@freezed
class PendingWorkoutSaveState with _$PendingWorkoutSaveState {
  const factory PendingWorkoutSaveState.idle() = _Idle;

  const factory PendingWorkoutSaveState.saving() = _Saving;
}
