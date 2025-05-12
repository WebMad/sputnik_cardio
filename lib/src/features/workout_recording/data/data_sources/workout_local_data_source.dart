import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';

abstract interface class WorkoutLocalDataSource {
  Future<List<Workout>> getActiveWorkouts();

  Future<void> setActiveWorkout(Workout workout);

  Future<void> removeWorkout(String uuid);

  Future<List<PendingWorkout>> getPendingWorkouts();

  Future<void> createPendingWorkout(PendingWorkout pendingWorkout);

  Future<void> removePendingWorkout(PendingWorkout pendingWorkout);
}

class WorkoutLocalDataSourceImpl implements WorkoutLocalDataSource {
  static const _workoutRecordingWorkoutsKey = 'workout_recording_workouts';
  static const _workoutRecordingPendingWorkoutsKey =
      'workout_recording_pending_workouts';

  final SharedPreferences _sharedPreferences;

  WorkoutLocalDataSourceImpl(this._sharedPreferences);

  String _getWorkoutKey(String uuid) => 'workout_recording_workout_$uuid';

  Future<void> _addActiveWorkoutUuid(String workoutUuid) async {
    final activeWorkouts = await _getActiveWorkoutsUuids();

    if (activeWorkouts.contains(workoutUuid)) {
      return;
    }

    final workouts = [...activeWorkouts, workoutUuid];

    await _sharedPreferences.setString(
      _workoutRecordingWorkoutsKey,
      jsonEncode(workouts),
    );
  }

  Future<void> _removeActiveWorkoutUuid(String uuid) async {
    final activeWorkouts = [...(await _getActiveWorkoutsUuids())]..remove(uuid);

    await _sharedPreferences.setString(
      _workoutRecordingWorkoutsKey,
      jsonEncode(activeWorkouts),
    );
  }

  Future<List<String>> _getActiveWorkoutsUuids() async {
    final workouts = _sharedPreferences.getString(_workoutRecordingWorkoutsKey);

    if (workouts == null) {
      return [];
    }

    return (jsonDecode(workouts) as List<dynamic>).cast<String>();
  }

  @override
  Future<void> setActiveWorkout(Workout workout) async {
    _addActiveWorkoutUuid(workout.uuid);

    await _sharedPreferences.setString(
      _getWorkoutKey(workout.uuid),
      jsonEncode(workout.toJson()),
    );
  }

  @override
  Future<List<Workout>> getActiveWorkouts() async {
    final uuids = await _getActiveWorkoutsUuids();

    final workouts = <Workout>[];

    for (final uuid in uuids) {
      final rawWorkout = _sharedPreferences.getString(
        _getWorkoutKey(uuid),
      );

      if (rawWorkout == null) {
        continue;
      }

      final workout = Workout.fromJson(
        (jsonDecode(rawWorkout) as Map<dynamic, dynamic>)
            .cast<String, dynamic>(),
      );

      workouts.add(workout);
    }

    return workouts;
  }

  @override
  Future<void> removeWorkout(String uuid) async {
    await _sharedPreferences.remove(_getWorkoutKey(uuid));
    _removeActiveWorkoutUuid(uuid);
  }

  @override
  Future<List<PendingWorkout>> getPendingWorkouts() async {
    final rawPendingWorkouts =
        _sharedPreferences.getString(_workoutRecordingPendingWorkoutsKey);

    final pendingWorkouts = rawPendingWorkouts != null
        ? (jsonDecode(rawPendingWorkouts) as List<dynamic>)
            .map(
              (e) => PendingWorkout.fromJson(e as Map<String, dynamic>),
            )
            .toList()
        : <PendingWorkout>[];

    return pendingWorkouts;
  }

  @override
  Future<void> createPendingWorkout(PendingWorkout pendingWorkout) async {
    final pendingWorkouts = [...await getPendingWorkouts()];

    pendingWorkouts.add(pendingWorkout);

    await _sharedPreferences.setString(
      _workoutRecordingPendingWorkoutsKey,
      jsonEncode(pendingWorkouts),
    );
  }

  @override
  Future<void> removePendingWorkout(PendingWorkout pendingWorkout) async {
    final pendingWorkouts = [...await getPendingWorkouts()]..removeWhere(
        (element) => element.workout.uuid == pendingWorkout.workout.uuid,
      );

    await _sharedPreferences.setString(
      _workoutRecordingPendingWorkoutsKey,
      jsonEncode(pendingWorkouts),
    );
  }
}
