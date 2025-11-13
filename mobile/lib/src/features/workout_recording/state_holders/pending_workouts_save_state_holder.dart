import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../models/pending_workout_save_state.dart';

class PendingWorkoutsSaveStateHolder
    extends StateHolder<PendingWorkoutSaveState> {
  PendingWorkoutsSaveStateHolder()
      : super(const PendingWorkoutSaveState.idle());

  void update(PendingWorkoutSaveState newState) {
    state = newState;
  }
}
