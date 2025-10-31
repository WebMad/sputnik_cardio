import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_list_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';
import '../models/progress_screen_state.dart';

class ProgressScreenPresenter extends StateHolder<ProgressScreenState>{
  final WorkoutsListStateHolder _workoutsListStateHolder;
  final WorkoutListManager _workoutListManager;
  ProgressScreenPresenter(
      this._workoutListManager,
      this._workoutsListStateHolder,
      ): super(const ProgressScreenState(
    lastWeekWorkouts: [],
    status: ProgressScreenStatus.loading,
    charData: [],
  ),
  );
  StreamSubscription<WorkoutsListData?>? _workoutSubscription;
  @override
  Future<void> init() async{
    super.init();
    _workoutSubscription = _workoutsListStateHolder.asStream.listen(_handleWorkoutsDataUpdate);
  }
  void _handleWorkoutsDataUpdate(WorkoutsListData? data){
    if (data==null) return;
    data.map(
      loading: (_){
        if (state.lastWeekWorkouts.isEmpty){
          state = state.copyWith(
            status: ProgressScreenStatus.loading,
          );
        }
      },
      data: (dataState){
        final lastWeekWorkouts = _getLastWeekWorkouts(dataState.workouts);
        final chartData = _calculateChartData(lastWeekWorkouts);
        state = state.copyWith(
          lastWeekWorkouts: lastWeekWorkouts,
          charData: chartData,
          status: ProgressScreenStatus.loaded,
        );
      },
    );
  }
  List<DetailedWorkout> _getLastWeekWorkouts(List<DetailedWorkout> allWorkouts){
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return allWorkouts.where((workout){
      return workout.workout.startAt.isAfter(weekAgo) && workout.metrics!=null;
    }).toList();
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
      distancesByDay.update(day, (value) => value + distance,
          ifAbsent: () => distance);
    }
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - DateTime.monday));
    return List.generate(7, (index) {
      final day = firstDayOfWeek.add(Duration(days: index));
      final dayKey = DateTime(day.year, day.month, day.day);
      return distancesByDay[dayKey] ?? 0.0;
    });
  }
    Future<void> refreshWorkouts() async {
      await _workoutListManager.refresh();
    }
    @override
    Future<void> dispose() async{
      await _workoutSubscription?.cancel();
      await super.dispose();
    }

}
