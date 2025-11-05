import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import '../managers/last_week_workout_manager.dart';
import '../models/progress_screen_state.dart';

class ProgressScreenPresenter extends StateHolder<ProgressScreenState> {
  final LastWeekWorkoutsManager _lastWeekWorkoutsManager;

  ProgressScreenPresenter(
      this._lastWeekWorkoutsManager,
      ) : super(
    const ProgressScreenState(
      lastWeekWorkouts: [],
      status: ProgressScreenStatus.loading,
      charData: [],
    ),
  );

  StreamSubscription<List<DetailedWorkout>>? _lastWeekWorkoutsSubscription;

  @override
  Future<void> init() async {
    super.init();
    _lastWeekWorkoutsSubscription =
        _lastWeekWorkoutsManager.stateHolder.asStream.listen(_handleLastWeekWorkoutsUpdate);
    await _lastWeekWorkoutsManager.loadLastWeekWorkouts();
  }

  void _handleLastWeekWorkoutsUpdate(List<DetailedWorkout> workouts) {

    final chartData = _calculateChartData(workouts);
    state = state.copyWith(
      lastWeekWorkouts: workouts,
      charData: chartData,
      status: ProgressScreenStatus.loaded,
    );
  }

  List<double> _calculateChartData(List<DetailedWorkout> workouts) {
    final distancesByDay = <DateTime, double>{};

    for (final workout in workouts) {
      final day = DateTime(
        workout.workout.startAt.year,
        workout.workout.startAt.month,
        workout.workout.startAt.day,
      );

      final distance = workout.metrics!.kms;
      distancesByDay.update(
        day,
            (value) => value + distance,
        ifAbsent: () => distance,
      );
    }

    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final chartData = List.generate(7, (index) {
      final day = firstDayOfWeek.add(Duration(days: index));
      final dayKey = DateTime(day.year, day.month, day.day);
      final distance = distancesByDay[dayKey] ?? 0.0;
      return distance;
    });
    return chartData;
  }

  Future<void> refreshWorkouts() async {
    await _lastWeekWorkoutsManager.loadLastWeekWorkouts();
  }

  @override
  Future<void> dispose() async {
    await _lastWeekWorkoutsSubscription?.cancel();
    await super.dispose();
  }
}