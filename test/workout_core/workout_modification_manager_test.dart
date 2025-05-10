import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/managers/workout_modification_manager.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('Start workout', () {
    final workoutStateHolder = WorkoutStateHolder();

    final workoutModificationManager = _createManager(workoutStateHolder);
    workoutModificationManager.start();

    expect(workoutStateHolder.workout?.state, WorkoutState.inProcess);
    expect(workoutStateHolder.workout?.segments.isEmpty, true);
    expect(workoutStateHolder.workout?.stopAt, null);
  });

  test('Add workout segment', () {
    final workoutStateHolder = WorkoutStateHolder();
    final workoutModificationManager = _createManager(workoutStateHolder);

    workoutModificationManager.start();

    workoutModificationManager.addSegment(segmentType: WorkoutSegmentType.run);

    final workout = workoutStateHolder.workout;

    expect(workout?.segments.length, 1);
    expect(workout?.state, WorkoutState.inProcess);
    expect(workout?.lastSegment?.type, WorkoutSegmentType.run);

    workoutModificationManager.finishSegment(endAt: DateTime(2024));

    workoutModificationManager.addSegment(
        segmentType: WorkoutSegmentType.cycling);

    final workout2 = workoutStateHolder.workout;

    expect(workout2?.segments.length, 2);
    expect(workout2?.state, WorkoutState.inProcess);
    expect(workout2?.lastSegment?.type, WorkoutSegmentType.cycling);
    expect(workout2?.segments.first.endAt, DateTime(2024));
  });

  test('Pause workout', () {
    final workoutStateHolder = WorkoutStateHolder();

    final workoutModificationManager = _createManager(workoutStateHolder);
    workoutModificationManager.start();

    final workout = workoutStateHolder.workout;

    expect(workout?.state, WorkoutState.inProcess);
    expect(workout?.segments.isEmpty, true);
    expect(workout?.stopAt, null);
  });

  test('Finish segment', () {
    final workoutStateHolder = WorkoutStateHolder();

    final manager = _createManager(workoutStateHolder);

    manager.start();
    manager.addSegment(segmentType: WorkoutSegmentType.run);
    manager.finishSegment();

    final workout = workoutStateHolder.workout;

    expect(workout?.lastSegment?.type, WorkoutSegmentType.run);
    expect(workout?.segments.length, 1);
    expect(workout?.state, WorkoutState.inProcess);
  });

  test('Finish segment with custom time', () {
    final workoutStateHolder = WorkoutStateHolder();

    final manager = _createManager(workoutStateHolder);

    manager.start();
    manager.addSegment(segmentType: WorkoutSegmentType.run);

    manager.finishSegment(endAt: DateTime(2024));

    expect(workoutStateHolder.workout?.lastSegment?.endAt, DateTime(2024));
  });
}

WorkoutModificationManager _createManager(
    WorkoutStateHolder workoutStateHolder) {
  const uuid = Uuid();
  return WorkoutModificationManager(
    uuid,
    WorkoutSegmentFactory(uuid),
    WorkoutFactory(uuid),
    workoutStateHolder,
  );
}
