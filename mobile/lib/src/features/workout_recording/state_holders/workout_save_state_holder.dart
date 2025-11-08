import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_save_state.dart';

class WorkoutSaveStateHolder extends StateHolder<WorkoutSaveState> {
  WorkoutSaveStateHolder() : super(const WorkoutSaveState.idle());

  void update(WorkoutSaveState state) {
    this.state = state;
  }
}
