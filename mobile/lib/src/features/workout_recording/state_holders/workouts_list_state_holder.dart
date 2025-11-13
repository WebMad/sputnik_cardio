import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';

import '../models/workouts_list_data.dart';

class WorkoutsListStateHolder extends StateHolder<WorkoutsListData> {
  WorkoutsListStateHolder() : super(const WorkoutsListData.loading());

  void update(WorkoutsListData workoutsListData) {
    state = workoutsListData;
  }
}
