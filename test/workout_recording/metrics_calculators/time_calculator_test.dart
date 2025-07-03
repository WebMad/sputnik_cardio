import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/time_calculator.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';

void main() {
  late TimeCalculator timeCalculator;

  setUp(() {
    timeCalculator = TimeCalculator();
  });

  test('calcTime returns zero duration for empty workout', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    expect(result.inSeconds, 0);
  });

  test('calcTime returns zero duration for workout with only pause segments',
      () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 0, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5, 30),
        ),
      ],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    expect(result.inSeconds, 0);
  });

  test('calcTime returns correct duration for workout with active segments',
      () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5, 30),
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 5, 30),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 10, 45),
        ),
        WorkoutSegment(
          uuid: 'segment-3',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 10, 45),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 10, 20, 15),
        ),
      ],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    // 5 min 30 sec for run + 9 min 30 sec for cycling = 15 min = 900 seconds
    expect(result.inSeconds, 330 + 570); // 900 seconds
  });

  test('calcTime uses current time for segments without endAt', () {
    // Arrange
    final now = DateTime.now();
    final startTime = now.subtract(Duration(seconds: 30));

    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: startTime,
          routeUuid: 'route-1',
          // No endAt - should use current time
        ),
      ],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    // Should be approximately 30 seconds, but allow some flexibility for test execution time
    expect(result.inSeconds, greaterThanOrEqualTo(29));
    expect(result.inSeconds, lessThanOrEqualTo(40));
  });

  test('calcTime handles multiple active segments with precise timing', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 15, 23),
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 15, 23),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 20, 37),
        ),
        WorkoutSegment(
          uuid: 'segment-3',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 20, 37),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 10, 35, 42),
        ),
        WorkoutSegment(
          uuid: 'segment-4',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 35, 42),
          routeUuid: 'route-4',
          endAt: DateTime(2023, 1, 1, 11, 0, 12),
        ),
      ],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    // First run: 15 min 23 sec = 923 seconds
    // Second run: 15 min 5 sec = 905 seconds
    // Cycling: 24 min 30 sec = 1470 seconds
    // Total: 3298 seconds
    const expectedSeconds = 923 + 905 + 1470;
    expect(result.inSeconds, expectedSeconds);
  });

  test('calcTime handles segments with millisecond precision', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0, 0, 250),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 0, 30, 750),
        ),
      ],
    );

    // Act
    final result = timeCalculator.calcTime(workout);

    // Assert
    // 30.5 seconds = 30 seconds (when using inSeconds)
    expect(result.inSeconds, 30);
    // But milliseconds should be accurate
    expect(result.inMilliseconds, 30500);
  });
}
