import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import '../managers/last_week_workout_manager.dart';
import '../models/progress_screen_state.dart';
import '../state_holders/last_week_workout_state_holder.dart';

class ProgressScreenPresenter extends StateHolder<ProgressScreenState> {
  final LastWeekWorkoutsManager _lastWeekWorkoutsManager;
  final LastWeekWorkoutsStateHolder _lastWeekWorkoutsStateHolder;
  StreamSubscription<List<DetailedWorkout>>? _lastWeekWorkoutsSubscription;
  ProgressScreenPresenter(
    this._lastWeekWorkoutsManager,
    this._lastWeekWorkoutsStateHolder,
  ) : super(
          const ProgressScreenState(
            lastWeekWorkouts: [],
            status: ProgressScreenStatus.loading,
            chartData: [],
          ),
        );

  @override
  Future<void> init() async {
    super.init();
    _lastWeekWorkoutsSubscription = _lastWeekWorkoutsStateHolder.asStream
        .listen((workouts) => _handleLastWeekWorkoutsUpdate(workouts));
    _lastWeekWorkoutsManager.loadLastWeekWorkouts();
  }

  void _handleLastWeekWorkoutsUpdate(List<DetailedWorkout> workouts) {
    final chartData = _calculateChartData(workouts);
    state = state.copyWith(
      lastWeekWorkouts: workouts,
      chartData: chartData,
      status: ProgressScreenStatus.loaded,
    );
  }

  List<double> _calculateChartData(List<DetailedWorkout> workouts) {
    final distancesByDay = <DateTime, double>{};

    for (final workout in workouts) {
      final startAt = workout.workout.startAt;
      final day = DateTime(
        startAt.year,
        startAt.month,
        startAt.day,
      );

      final distance = workout.metrics?.kms ?? 0;
      distancesByDay.update(
        day,
        (value) => value + distance,
        ifAbsent: () => distance,
      );
    }

    final now = DateTime.now();
    final firstDayOfWeekSubstracted =
        now.subtract(Duration(days: now.weekday - 1));
    final firstDayOfWeek = DateTime(
      firstDayOfWeekSubstracted.year,
      firstDayOfWeekSubstracted.month,
      firstDayOfWeekSubstracted.day,
    );
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
    _lastWeekWorkoutsSubscription?.cancel();
    _lastWeekWorkoutsSubscription = null;
    await super.dispose();
  }
}
