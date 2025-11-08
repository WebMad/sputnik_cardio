import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/pace_calculator.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';

void main() {
  late PaceCalculator calculator;

  setUp(() {
    calculator = const PaceCalculator();
  });

  test('calculates pace correctly', () {
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

    // For 5 km in 30 minutes, pace should be 6 min/km
    final pace = calculator.calcPace(5.0, workout);
    expect(pace, const Duration(minutes: 6));
  });

  test('returns 0 when distance is 0', () {
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

    final pace = calculator.calcPace(0.0, workout);
    expect(pace, Duration.zero);
  });

  test('ignores non-active segments', () {
    final now = DateTime.now();
    final startAt = now.subtract(const Duration(minutes: 60));

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
          startAt: now.subtract(const Duration(minutes: 30)),
          endAt: now,
        ),
        WorkoutSegment(
          uuid: 'segment2',
          routeUuid: 'route2',
          type: WorkoutSegmentType.pause,
          startAt: now.subtract(const Duration(minutes: 60)),
          endAt: now.subtract(const Duration(minutes: 30)),
        ),
      ],
    );

    // Should only count the 30 minutes from active segment
    final pace = calculator.calcPace(5.0, workout);
    expect(pace, const Duration(minutes: 6));
  });
}
