import 'package:test/test.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('Start workout', () {
    final factory = _createManagerFactory();
    final workoutModificationManager = factory.create();
    final workoutProvider = workoutModificationManager.workoutProvider;

    expect(workoutProvider.workout.state, WorkoutState.inProcess);
    expect(workoutProvider.workout.segments.isEmpty, true);
    expect(workoutProvider.workout.stopAt, null);
  });

  test('Add workout segment', () {
    final factory = _createManagerFactory();
    final workoutModificationManager = factory.create();
    final workoutProvider = workoutModificationManager.workoutProvider;

    workoutModificationManager.addSegment(segmentType: WorkoutSegmentType.run);

    final workout = workoutProvider.workout;

    expect(workout.segments.length, 1);
    expect(workout.state, WorkoutState.inProcess);
    expect(workout.lastSegment?.type, WorkoutSegmentType.run);

    workoutModificationManager.finishSegment(endAt: DateTime(2024));

    workoutModificationManager.addSegment(
        segmentType: WorkoutSegmentType.cycling);

    final workout2 = workoutProvider.workout;

    expect(workout2.segments.length, 2);
    expect(workout2.state, WorkoutState.inProcess);
    expect(workout2.lastSegment?.type, WorkoutSegmentType.cycling);
    expect(workout2.segments.first.endAt, DateTime(2024));
  });

  test('Pause workout', () {
    final factory = _createManagerFactory();
    final workoutModificationManager = factory.create();
    final workoutProvider = workoutModificationManager.workoutProvider;

    final workout = workoutProvider.workout;

    expect(workout.state, WorkoutState.inProcess);
    expect(workout.segments.isEmpty, true);
    expect(workout.stopAt, null);
  });

  test('Finish segment', () {
    final factory = _createManagerFactory();
    final workoutModificationManager = factory.create();
    final workoutProvider = workoutModificationManager.workoutProvider;

    workoutModificationManager.addSegment(segmentType: WorkoutSegmentType.run);
    workoutModificationManager.finishSegment();

    final workout = workoutProvider.workout;

    expect(workout.lastSegment?.type, WorkoutSegmentType.run);
    expect(workout.segments.length, 1);
    expect(workout.state, WorkoutState.inProcess);
  });

  test('Finish segment with custom time', () {
    final factory = _createManagerFactory();
    final workoutModificationManager = factory.create();
    final workoutProvider = workoutModificationManager.workoutProvider;

    workoutModificationManager.addSegment(segmentType: WorkoutSegmentType.run);

    workoutModificationManager.finishSegment(endAt: DateTime(2024));

    expect(workoutProvider.workout.lastSegment?.endAt, DateTime(2024));
  });
}

WorkoutModificationManagerFactory _createManagerFactory() {
  const uuid = Uuid();

  return WorkoutModificationManagerFactory(
    WorkoutFactory(uuid),
    WorkoutSegmentFactory(uuid),
    uuid,
  );
}
