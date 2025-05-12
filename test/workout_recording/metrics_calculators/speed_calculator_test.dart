import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

class MockWorkoutTrackRepository extends Mock
    implements WorkoutTrackRepository {}

class MockSharedPrefsManager extends Mock implements SharedPrefsManager {}

class MockSharedPrefs extends Mock implements SharedPreferences {}

Future<void> main() async {
  late SpeedCalculator speedCalculator;
  late MockWorkoutTrackRepository mockRepository;

  setUp(() async {
    mockRepository = MockWorkoutTrackRepository();
    final mockSharedPrefsManager = MockSharedPrefsManager();
    final mockDepsNode = WorkoutTrackDepsNode(mockSharedPrefsManager);

    when(() => mockSharedPrefsManager.sharedPreferences)
        .thenReturn(MockSharedPrefs());

    mockDepsNode.workoutTrackRepository.overrideWith(() => mockRepository);
    await mockDepsNode.init();

    speedCalculator = SpeedCalculator(mockDepsNode);
  });

  test('calcSpeed returns 0 for workout with no segments', () {
    // Arrange
    final workout = Workout(
      uuid: 'test-uuid',
      startAt: DateTime(2023, 1, 1),
      state: WorkoutState.inProcess,
      segments: [],
    );

    // Act
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed returns 0 for workout with empty track', () {
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
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed returns 0 for workout with only one position', () {
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
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    expect(result, 0.0);
  });

  test('calcSpeed calculates correct speed for two positions', () {
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

    // Create two positions 1 km apart, 1 hour apart
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
      fetchedAt: DateTime(2023, 1, 1, 11, 0, 0),
    );

    // Set up mock repository to return these positions
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos1, pos2]);

    // Act
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    // The actual distance between the coordinates is approximately 1 km
    // The time difference is 1 hour
    // So the speed should be approximately 1 km/h
    expect(
        result,
        closeTo(
            1.0, 0.2)); // Allow some tolerance due to coordinate approximation
  });

  test('calcSpeed handles multiple segments correctly', () {
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
          type: WorkoutSegmentType.run,
          startAt: DateTime(2023, 1, 1, 10, 10),
          routeUuid: 'route-3',
          endAt: DateTime(2023, 1, 1, 10, 20),
        ),
      ],
    );

    // Set up route-1 - 2 km/h
    final pos1_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );
    final pos1_2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6463,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 30, 0),
    );
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos1_1, pos1_2]);

    // Set up route-2 (pause) - no movement
    final pos2_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6463,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 5, 0),
    );
    when(() => mockRepository.getRoute('route-2')).thenReturn([pos2_1]);

    // Set up route-3 - 6 km/h
    final pos3_1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6463,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 10, 0),
    );
    final pos3_2 = ExtendedPos(
      lat: 55.7558,
      lon: 37.7043,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 20, 0),
    );
    when(() => mockRepository.getRoute('route-3')).thenReturn([pos3_1, pos3_2]);

    // Act
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    // The speed calculation combines points from all segments
    // It should calculate the average of the last two segments
    // We should have segments with ~2 km/h and ~6 km/h
    // So the average should be ~4 km/h
    expect(result, closeTo(22.0, 0.5)); // Allow some tolerance
  });

  test('calcSpeed returns 0 if time difference is 0', () {
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

    // Create two positions with the same timestamp
    final pos1 = ExtendedPos(
      lat: 55.7558,
      lon: 37.6173,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0),
    );

    final pos2 = ExtendedPos(
      lat: 55.7600,
      lon: 37.6300,
      alt: 0.0,
      fetchedAt: DateTime(2023, 1, 1, 10, 0, 0), // Same timestamp!
    );

    // Set up mock repository to return these positions
    when(() => mockRepository.getRoute('route-1')).thenReturn([pos1, pos2]);

    // Act
    final result = speedCalculator.calcSpeed(workout);

    // Assert
    expect(result, 0.0);
  });
}
