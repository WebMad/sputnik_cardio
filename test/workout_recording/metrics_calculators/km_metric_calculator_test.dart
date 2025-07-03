import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/km_metric_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:sputnik_location/sputnik_location.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';

class MockWorkoutTrackRepository extends Mock
    implements WorkoutTrackRepository {}

class MockSharedPrefsManager extends Mock implements SharedPrefsManager {}

class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  late KmMetricCalculator kmMetricCalculator;
  late MockWorkoutTrackRepository mockRepository;

  setUp(() async {
    mockRepository = MockWorkoutTrackRepository();
    final mockSharedPrefsManager = MockSharedPrefsManager();
    final mockDepsNode = WorkoutTrackDepsNode(mockSharedPrefsManager);

    when(() => mockSharedPrefsManager.sharedPreferences)
        .thenReturn(MockSharedPrefs());

    mockDepsNode.workoutTrackRepository.overrideWith(() => mockRepository);
    await mockDepsNode.init();

    kmMetricCalculator = KmMetricCalculator(mockDepsNode);
  });

  test('calcDistanceForWorkout returns 0 for workout with no segments', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [],
    );

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcDistanceForWorkout returns 0 for workout with only pause segments',
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
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5),
        ),
      ],
    );

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcDistanceForWorkout returns 0 for empty track', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5),
        ),
      ],
    );

    // Set up mock repository to return empty track
    when(() => mockRepository.getRoute('route-1')).thenReturn([]);

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcDistanceForWorkout returns 0 for track with only one position', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5),
        ),
      ],
    );

    final pos = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );

    // Set up mock repository to return a single position
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos]);

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcDistanceForWorkout calculates correct distance for single segment',
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
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5),
        ),
      ],
    );

    // Create two positions 1 km apart
    // Moscow coordinates
    final pos1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );

    // About 1km east from pos1 (approximate, not exact)
    final pos2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6318,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 5, 0),
    );

    // Set up mock repository to return these positions
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos1, pos2]);

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    // The actual distance between the coordinates is approximately 1 km
    expect(
        result,
        closeTo(
            1.0, 0.2)); // Allow some tolerance due to coordinate approximation
  });

  test(
      'calcDistanceForWorkout calculates sum of distances for multiple segments',
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
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 5),
        ),
        WorkoutSegment(
          uuid: 'segment-2',
          type: WorkoutSegmentType.pause,
          startAt: DateTime(2023, 1, 1, 10, 5),
          routeUuid: 'route-2',
          endAt: DateTime(2023, 1, 1, 10, 10),
        ),
        WorkoutSegment(
          uuid: 'segment-3',
          type: WorkoutSegmentType.cycling,
          startAt: DateTime(2023, 1, 1, 10, 10),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 10, 20),
        ),
      ],
    );

    // Set up route-1 - 1 km
    final pos1_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );
    final pos1_2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6318,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 5, 0),
    );
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos1_1, pos1_2]);

    // Set up route-2 (pause) - should be ignored
    final pos2_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6318,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 5, 0),
    );
    final pos2_2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6400,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 10, 0),
    );
    when(() => mockRepository.getRoute('route-2')).thenReturn([pos2_1, pos2_2]);

    // Set up route-3 - 3 km
    final pos3_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6400,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 10, 0),
    );
    final pos3_2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6700,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 15, 0),
    );
    final pos3_3 = ExtendedPos(
      lat: 55.7558,
      lon: 37.7000,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 20, 0),
    );
    when(() => mockRepository.getRoute('route-3'))
        .thenReturn([pos3_1, pos3_2, pos3_3]);

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    // Route 1: ~1 km
    // Route 3: ~3.75 km
    // Route 2: pause segment, not counted
    // Total: ~5 km
    expect(result, closeTo(5.0, 0.5)); // Allow some tolerance
  });

  test('calcDistanceForWorkout handles multi-point track correctly', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [
        WorkoutSegment(
          uuid: 'segment-1',
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 0),
          routeUuid: 'route-1',
          endAt: DateTime(2023, 1, 1, 10, 15),
        ),
      ],
    );

    // Create a zigzag path to test multiple point calculation
    final pos1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );
    final pos2 = ExtendedPos(
      lat: 55.7658, lon: 37.6273, alt: 0.0, // North-east
      fetchedAt: DateTime(2023, 1, 1, 10, 5, 0),
    );
    final pos3 = ExtendedPos(
      lat: 55.7558, lon: 37.6373, alt: 0.0, // South-east
      fetchedAt: DateTime(2023, 1, 1, 10, 10, 0),
    );
    final pos4 = ExtendedPos(
      lat: 55.7658, lon: 37.6473, alt: 0.0, // North-east
      fetchedAt: DateTime(2023, 1, 1, 10, 15, 0),
    );

    when(() => mockRepository.getRoute('route-1'))
        .thenReturn([pos1, pos2, pos3, pos4]);

    // Act
    final result = kmMetricCalculator.calcDistanceForWorkout(workout);

    // Assert
    // The distance should be the sum of all segments
    // Each segment is roughly 1-1.5 km, so total should be ~3-4.5 km
    expect(result, greaterThan(3.0));
    expect(result, lessThan(4.5));
  });
}
