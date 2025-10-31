import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
part 'progress_screen_state.freezed.dart';

@freezed
class ProgressScreenState with _$ProgressScreenState {
  const factory ProgressScreenState({
    required List<DetailedWorkout> lastWeekWorkouts,
    required ProgressScreenStatus status,
    required List<double> charData,
  }) = _ProgressScreenState;

  factory ProgressScreenState.initial() => const ProgressScreenState(
    lastWeekWorkouts: [],
    status: ProgressScreenStatus.loading,
    charData: [],
  );
}

enum ProgressScreenStatus {
  loading,
  loaded,
  error,
}