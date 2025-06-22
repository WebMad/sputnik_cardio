import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_save_state.freezed.dart';

@freezed
class WorkoutSaveState with _$WorkoutSaveState {
  const factory WorkoutSaveState.idle() = _Idle;

  const factory WorkoutSaveState.saving() = _Saving;

  const factory WorkoutSaveState.saved() = _Saved;

  const factory WorkoutSaveState.error() = _Error;
}
