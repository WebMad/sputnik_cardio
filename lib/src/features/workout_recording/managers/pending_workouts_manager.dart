import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_local_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/repository/workout_repository.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_state_holder.dart';

import '../../internet_connection_checker/state_holder/internet_connection_state_holder.dart';

class PendingWorkoutsManager implements Lifecycle {
  final PendingWorkoutsStateHolder _pendingWorkoutsStateHolder;
  final WorkoutLocalDataSource _workoutDataSource;
  final WorkoutRepository _workoutRepository;
  final InternetConnectionStateHolder _internetConnectionStateHolder;

  PendingWorkoutsManager(
    this._pendingWorkoutsStateHolder,
    this._workoutDataSource,
    this._internetConnectionStateHolder,
    this._workoutRepository,
  );

  @override
  Future<void> init() async {
    updateList();

    _internetConnectionStateHolder.asStream
        .where(
          (connections) => _internetConnectionStateHolder.hasInternet,
        )
        .asyncMap((_) => _syncWorkouts())
        .listen((_) {});
  }

  Future<void> updateList() async {
    final pendingWorkouts = await _workoutDataSource.getPendingWorkouts();

    _pendingWorkoutsStateHolder.update(pendingWorkouts);
  }

  Future<void> _syncWorkouts() async {
    final pendingWorkouts = [..._pendingWorkoutsStateHolder.state];

    for (final pendingWorkout in pendingWorkouts) {
      try {
        await _workoutRepository.savePendingWorkout(pendingWorkout);
        _pendingWorkoutsStateHolder.remove(pendingWorkout);
        _workoutDataSource.removePendingWorkout(pendingWorkout);
      } on Object catch (_, __) {}
    }
  }

  @override
  Future<void> dispose() async {}
}
