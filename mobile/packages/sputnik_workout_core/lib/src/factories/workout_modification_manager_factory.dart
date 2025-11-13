import 'package:uuid/uuid.dart';

import '../managers/workout_modification_manager.dart';
import '../models/workout.dart';
import '../state_holders/workout_state_holder.dart';
import 'workout_factory.dart';
import 'workout_segment_factory.dart';

class WorkoutModificationManagerFactory {
  final WorkoutFactory _workoutFactory;
  final WorkoutSegmentFactory _workoutSegmentFactory;
  final Uuid uuid;

  WorkoutModificationManagerFactory(
    this._workoutFactory,
    this._workoutSegmentFactory,
    this.uuid,
  );

  WorkoutModificationManager create() {
    final workout = _workoutFactory.create().copyWith(
      state: WorkoutState.inProcess,
    );

    final workoutStateHolder = WorkoutStateHolder(workout);

    return WorkoutModificationManager(
      uuid,
      _workoutSegmentFactory,
      workoutStateHolder,
    );
  }
}
