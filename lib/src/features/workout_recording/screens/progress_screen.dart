import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_list_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<DetailedWorkout> _lastWeekWorkouts = [];
  late WorkoutListManager _workoutListManager;
  late WorkoutsListStateHolder _workoutsListStateHolder;
  bool _dependenciesInitialized = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dependenciesInitialized) {
      _initializeDependencies();
      _loadWorkouts();
      _dependenciesInitialized = true;
    }
  }
  void _initializeDependencies() {
    final workoutDepsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);
    _workoutListManager = workoutDepsNode.workoutListManager();
    _workoutsListStateHolder = workoutDepsNode.workoutsListStateHolder();
  }

  Future<void> _loadWorkouts() async {
    await _workoutListManager.refresh();
    _updateWorkouts();
  }

  void _updateWorkouts() {
    final workoutsListData = _workoutsListStateHolder.state;
    final dataState = workoutsListData.dataOrNull;

    if (dataState != null) {
      final weekAgo = DateTime.now().subtract(const Duration(days: 7));

      setState(() {
        _lastWeekWorkouts = dataState.workouts.where((detailedWorkout) {
          return detailedWorkout.workout.startAt.isAfter(weekAgo) &&
              detailedWorkout.metrics != null;
        }).toList();
      });
    }
  }

  List<double> _getChartData() {
    final distancesByDay = <DateTime, double>{};

    for (final workout in _lastWeekWorkouts) {
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
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    return List.generate(7, (index) {
      final day = firstDayOfWeek.add(Duration(days: index));
      final dayKey = DateTime(day.year, day.month, day.day);
      return distancesByDay[dayKey] ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartData = _getChartData();
    final dayLabels = [
      AppLocalizations.of(context).mon,
      AppLocalizations.of(context).tue,
      AppLocalizations.of(context).wed,
      AppLocalizations.of(context).thu,
      AppLocalizations.of(context).fri,
      AppLocalizations.of(context).sat,
      AppLocalizations.of(context).sun,
    ];
    final maxDistance = chartData.isNotEmpty ? chartData.reduce((a, b) => a > b ? a : b) : 0.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr.progress,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.tr.distancePastWeek,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _lastWeekWorkouts.isEmpty
                  ? Center(child: Text(context.tr.noWorkoutsThisWeek))
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // График
                    Container(
                      height: 180,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(chartData.length, (index) {
                          final heightFactor = maxDistance > 0 ? chartData[index] / maxDistance : 0;
                          final barHeight = 120 * heightFactor.toDouble();
                          return Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  chartData[index].toInt().toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 20,
                                  height: barHeight > 0 ? barHeight : 2,
                                  decoration: BoxDecoration(
                                    color: chartData[index] > 0 ? Colors.grey : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  dayLabels[index],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}