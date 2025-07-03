import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/last_km_pace_calculator.dart';
import 'package:sputnik_location/sputnik_location.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';

class MockWorkoutTrackDepsNode extends Mock implements WorkoutTrackDepsNode {}

class MockWorkoutTrackRepository extends Mock
    implements WorkoutTrackRepository {}

class MockSharedPrefsManager extends Mock implements SharedPrefsManager {}

class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  late LastKmPaceCalculator calculator;
  late MockWorkoutTrackRepository mockWorkoutTrackRepository;

  setUp(() async {
    mockWorkoutTrackRepository = MockWorkoutTrackRepository();
    final mockSharedPrefsManager = MockSharedPrefsManager();
    final mockDepsNode = WorkoutTrackDepsNode(mockSharedPrefsManager);

    when(() => mockSharedPrefsManager.sharedPreferences)
        .thenReturn(MockSharedPrefs());

    mockDepsNode.workoutTrackRepository
        .overrideWith(() => mockWorkoutTrackRepository);
    await mockDepsNode.init();

    calculator = LastKmPaceCalculator(mockDepsNode);
  });

  test('calculates pace for last kilometer correctly', () {
    final now = DateTime.now();
    final startAt = now.subtract(const Duration(minutes: 30));

    // Create a workout with one segment
    final workout = Workout(
      uuid: 'test',
      startAt: startAt,
      stopAt: now,
      state: WorkoutState.stopped,
      segments: [
        WorkoutSegment(
          uuid: 'segment1',
          routeUuid: 'route1',
          type: WorkoutSegmentType.run,
          startAt: startAt,
          endAt: now,
        ),
      ],
    );

    // Create route points that make up more than 1km
    // Points are 500m apart, so 3 points make 1km total
    final routePoints = [
      ExtendedPos(
        lat: 0,
        lon: 0,
        alt: 0,
        fetchedAt: now.subtract(const Duration(minutes: 10)),
      ),
      ExtendedPos(
        // ~500m north
        lat: 0.0045,
        lon: 0,
        alt: 0,
        fetchedAt: now.subtract(const Duration(minutes: 5)),
      ),
      ExtendedPos(
        // ~1km north
        lat: 0.009,
        lon: 0,
        alt: 0,
        fetchedAt: now,
      ),
    ];

    // Mock the repository to return our route points
    when(() => mockWorkoutTrackRepository.getRoute('route1'))
        .thenReturn(routePoints);

    // Calculate pace - should be 10 minutes for the last km
    final pace = calculator.calcPace(workout);
    expect(
      pace.inMilliseconds,
      closeTo(const Duration(minutes: 10).inMilliseconds, 500),
    );
  });

  test('returns 0 when not enough points', () {
    final now = DateTime.now();
    final startAt = now.subtract(const Duration(minutes: 30));

    final workout = Workout(
      uuid: 'test',
      startAt: startAt,
      stopAt: now,
      state: WorkoutState.stopped,
      segments: [
        WorkoutSegment(
          uuid: 'segment1',
          routeUuid: 'route1',
          type: WorkoutSegmentType.run,
          startAt: startAt,
          endAt: now,
        ),
      ],
    );

    // Only one point, not enough to calculate distance
    final routePoints = [
      ExtendedPos(
        lat: 0,
        lon: 0,
        alt: 0,
        fetchedAt: now,
      ),
    ];

    when(() => mockWorkoutTrackRepository.getRoute('route1'))
        .thenReturn(routePoints);

    final pace = calculator.calcPace(workout);
    expect(pace, Duration.zero);
  });

  test('distance is less than 1km', () {
    final now = DateTime.now();
    final startAt = now.subtract(const Duration(minutes: 30));

    final workout = Workout(
      uuid: 'test',
      startAt: startAt,
      stopAt: now,
      state: WorkoutState.stopped,
      segments: [
        WorkoutSegment(
          uuid: 'segment1',
          routeUuid: 'route1',
          type: WorkoutSegmentType.run,
          startAt: startAt,
          endAt: now,
        ),
      ],
    );

    // Points are only 200m apart, total distance is 400m (less than 1km)
    final routePoints = [
      ExtendedPos(
        lat: 0,
        lon: 0,
        alt: 0,
        fetchedAt: now.subtract(const Duration(minutes: 10)),
      ),
      ExtendedPos(
        // ~200m north
        lat: 0.0018,
        lon: 0,
        alt: 0,
        fetchedAt: now.subtract(const Duration(minutes: 5)),
      ),
      ExtendedPos(
        // ~400m north
        lat: 0.0036,
        lon: 0,
        alt: 0,
        fetchedAt: now,
      ),
    ];

    when(() => mockWorkoutTrackRepository.getRoute('route1'))
        .thenReturn(routePoints);

    final pace = calculator.calcPace(workout);
    expect(
      pace.inMilliseconds,
      closeTo(const Duration(minutes: 25).inMilliseconds, 2000),
    );
  });
}
