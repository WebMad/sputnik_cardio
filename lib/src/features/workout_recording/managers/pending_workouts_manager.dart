import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_local_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/repository/workout_repository.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_state_holder.dart';

import '../../internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import '../models/pending_workout_save_state.dart';
import '../state_holders/pending_workouts_save_state_holder.dart';

class PendingWorkoutsManager implements Lifecycle {
  final PendingWorkoutsStateHolder _pendingWorkoutsStateHolder;
  final WorkoutLocalDataSource _workoutDataSource;
  final WorkoutRepository _workoutRepository;
  final InternetConnectionStateHolder _internetConnectionStateHolder;
  final PendingWorkoutsSaveStateHolder _pendingWorkoutsSaveStateHolder;

  PendingWorkoutsManager(
    this._pendingWorkoutsStateHolder,
    this._workoutDataSource,
    this._internetConnectionStateHolder,
    this._workoutRepository,
    this._pendingWorkoutsSaveStateHolder,
  );

  @override
  Future<void> init() async {
    updateList();

    _internetConnectionStateHolder.asStream
        .where(
          (connections) => _internetConnectionStateHolder.hasInternet,
        )
        .asyncMap((_) => syncWorkouts())
        .listen((_) {});
  }

  Future<void> removeWorkout(String routeUuid) async {
    await _workoutDataSource.removePendingWorkout(routeUuid);
  }

  Future<void> updateList() async {
    final pendingWorkouts = await _workoutDataSource.getPendingWorkouts();

    _pendingWorkoutsStateHolder.update(pendingWorkouts);
  }

  Future<void> syncWorkouts() async {
    try {
      final isAlreadySaving = _pendingWorkoutsSaveStateHolder.state
              .mapOrNull(saving: (_) => true) ??
          false;
      if (isAlreadySaving) {
        return;
      }
      _pendingWorkoutsSaveStateHolder
          .update(const PendingWorkoutSaveState.saving());
      final pendingWorkouts = [..._pendingWorkoutsStateHolder.state];

      for (final pendingWorkout in pendingWorkouts) {
        try {
          await _workoutRepository.savePendingWorkout(pendingWorkout);
          _pendingWorkoutsStateHolder.remove(pendingWorkout);
          _workoutDataSource.removePendingWorkout(pendingWorkout.workout.uuid);
        } on Object catch (_, __) {}
      }
    } finally {
      _pendingWorkoutsSaveStateHolder
          .update(const PendingWorkoutSaveState.idle());
    }
  }

  @override
  Future<void> dispose() async {}
}
