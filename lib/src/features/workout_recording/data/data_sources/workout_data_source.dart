import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';

import '../../../workout_managing/models/workout.dart';

class WorkoutDataSource {
  static const _workoutRecordingWorkoutsKey = 'workout_recording_workouts';
  static const _workoutRecordingPendingWorkoutsKey =
      'workout_recording_pending_workouts';

  final SharedPreferences _sharedPreferences;

  WorkoutDataSource(this._sharedPreferences);

  String _getWorkoutKey(String uuid) => 'workout_recording_workout_$uuid';

  Future<void> addActiveWorkout(String workoutUuid) async {
    final activeWorkouts = await getActiveWorkouts();

    if (activeWorkouts.contains(workoutUuid)) {
      return;
    }

    final workouts = [...activeWorkouts, workoutUuid];

    await _sharedPreferences.setString(
      _workoutRecordingWorkoutsKey,
      jsonEncode(workouts),
    );
  }

  Future<void> removeActiveWorkout(String uuid) async {
    final activeWorkouts = [...(await getActiveWorkouts())]..remove(uuid);

    await _sharedPreferences.setString(
      _workoutRecordingWorkoutsKey,
      jsonEncode(activeWorkouts),
    );
  }

  Future<List<String>> getActiveWorkouts() async {
    final workouts = _sharedPreferences.getString(_workoutRecordingWorkoutsKey);

    if (workouts == null) {
      return [];
    }

    return (jsonDecode(workouts) as List<dynamic>).cast<String>();
  }

  Future<void> setWorkout(Workout workout) async {
    addActiveWorkout(workout.uuid);

    await _sharedPreferences.setString(
      _getWorkoutKey(workout.uuid),
      jsonEncode(workout.toJson()),
    );
  }

  Future<Workout?> getWorkout(String uuid) async {
    final workout = _sharedPreferences.getString(
      _getWorkoutKey(uuid),
    );

    if (workout == null) {
      return null;
    }

    return Workout.fromJson(
      (jsonDecode(workout) as Map<dynamic, dynamic>).cast<String, dynamic>(),
    );
  }

  Future<void> clearWorkout(String uuid) async {
    await _sharedPreferences.remove(uuid);

    removeActiveWorkout(uuid);
  }

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

  Future<void> createPendingWorkout(PendingWorkout pendingWorkout) async {
    final pendingWorkouts = [...await getPendingWorkouts()];

    pendingWorkouts.add(pendingWorkout);

    await _sharedPreferences.setString(
      _workoutRecordingPendingWorkoutsKey,
      jsonEncode(pendingWorkouts),
    );
  }

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
