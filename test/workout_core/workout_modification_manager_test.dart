import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/managers/workout_modification_manager.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('Start workout', () {
    final workoutModificationManager = _createManager();
    final workout = workoutModificationManager.start();

    expect(workout.state, WorkoutState.inProcess);
    expect(workout.segments.isEmpty, true);
    expect(workout.stopAt, null);
  });

  test('Add workout segment', () {
    final workoutModificationManager = _createManager();

    final workout = workoutModificationManager.addSegment(
      workout: workoutModificationManager.start(),
      segmentType: WorkoutSegmentType.run,
    );

    expect(workout.segments.length, 1);
    expect(workout.state, WorkoutState.inProcess);
    expect(workout.lastSegment?.type, WorkoutSegmentType.run);

    final workout2 = workoutModificationManager.addSegment(
      workout: workout,
      segmentType: WorkoutSegmentType.cycling,
    );

    expect(workout2.segments.length, 2);
    expect(workout2.state, WorkoutState.inProcess);
    expect(workout2.lastSegment?.type, WorkoutSegmentType.cycling);
  });

  test('Pause workout', () {
    final workoutModificationManager = _createManager();
    final workout = workoutModificationManager.start();

    expect(workout.state, WorkoutState.inProcess);
    expect(workout.segments.isEmpty, true);
    expect(workout.stopAt, null);
  });
}

WorkoutModificationManager _createManager() {
  const uuid = Uuid();
  return WorkoutModificationManager(
    uuid,
    WorkoutSegmentFactory(uuid),
    WorkoutFactory(uuid),
  );
}
