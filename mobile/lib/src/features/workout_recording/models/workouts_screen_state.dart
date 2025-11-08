import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
part 'workouts_screen_state.freezed.dart';

enum WorkoutsScreenStatus {
  loading,
  error,
  loaded,
}

@freezed
class WorkoutsScreenState with _$WorkoutsScreenState {
  const factory WorkoutsScreenState({
    required List<DetailedWorkout> workouts,
    required WorkoutsScreenStatus status,
    String? errorMessage,
    @Default(false) bool showErrorBanner,
  }) = _WorkoutsScreenState;

  const WorkoutsScreenState._();

  bool get isLoading => status == WorkoutsScreenStatus.loading;
  bool get isError => status == WorkoutsScreenStatus.error;
  bool get isLoaded => status == WorkoutsScreenStatus.loaded;
  bool get hasData => workouts.isNotEmpty;
}
