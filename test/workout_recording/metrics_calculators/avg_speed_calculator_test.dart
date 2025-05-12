import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/avg_speed_calculator.dart';

void main() {
  late AvgSpeedCalculator avgSpeedCalculator;

  setUp(() {
    avgSpeedCalculator = const AvgSpeedCalculator();
  });

  test('calcSpeed returns 0 if distance is 0', () {
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
          endAt: DateTime(2023, 1, 1, 10, 30, 0),
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(0, workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed returns 0 if workout has no segments', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(10.0, workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed returns 0 if workout has only pause segments', () {
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
          endAt: DateTime(2023, 1, 1, 10, 30, 0),
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(10.0, workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed calculates correct speed for single active segment', () {
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
          endAt: DateTime(2023, 1, 1, 11, 0, 0), // 1 hour
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(10.0, workout); // 10 km

    // Assert
    // 10 km / 1 hour = 10 km/h
    expect(result, 10.0);
  });

  test('calcSpeed calculates correct speed for multiple active segments', () {
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
          endAt: DateTime(2023, 1, 1, 10, 30, 0), // 30 minutes
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 30, 0),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 40, 0), // 10 minutes (not counted)
        ),
        WorkoutSegment(
          uuid: 'segment-3',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 40, 0),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 11, 10, 0), // 30 minutes
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(10.0, workout); // 10 km

    // Assert
    // 10 km / 1 hour (30 min + 30 min) = 10 km/h
    expect(result, 10.0);
  });

  test('calcSpeed uses current time for segments without endAt', () {
    // Arrange
    final now = DateTime.now();
    final startTime = now.subtract(Duration(hours: 1)); // 1 hour ago

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
    final result = avgSpeedCalculator.calcSpeed(10.0, workout); // 10 km

    // Assert
    // 10 km / ~1 hour = ~10 km/h, but allow some flexibility for test execution time
    expect(result, closeTo(10.0, 0.5));
  });

  test('calcSpeed handles precise time calculations correctly', () {
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
          endAt: DateTime(2023, 1, 1, 10, 15, 0), // 15 minutes
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 20, 0),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 35, 0), // 15 minutes
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(5.0, workout); // 5 km

    // Assert
    // 5 km / 0.5 hour (30 minutes) = 10 km/h
    expect(result, 10.0);
  });

  test('calcSpeed handles multiple segments with fractional hours', () {
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
          endAt: DateTime(2023, 1, 1, 10, 20, 0), // 20 minutes
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 20, 0),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 25, 0), // 5 minutes (not counted)
        ),
        WorkoutSegment(
          uuid: 'segment-3',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 25, 0),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 10, 40, 0), // 15 minutes
        ),
        WorkoutSegment(
          uuid: 'segment-4',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 40, 0),
          routeUuid: 'route-4',
          endAt: DateTime(2023, 1, 1, 10, 55, 0), // 15 minutes
        ),
      ],
    );

    // Act
    final result = avgSpeedCalculator.calcSpeed(8.33, workout); // 8.33 km

    // Assert
    // 8.33 km / 0.833 hour (50 minutes) = 10 km/h
    expect(result, closeTo(10.0, 0.1));
  });
}
