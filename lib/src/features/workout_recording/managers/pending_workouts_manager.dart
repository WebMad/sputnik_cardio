import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_state_holder.dart';

class PendingWorkoutsManager implements Lifecycle {
  final PendingWorkoutsStateHolder _pendingWorkoutsStateHolder;
  final WorkoutDataSource _workoutDataSource;
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final Connectivity _connectivity;

  PendingWorkoutsManager(
    this._pendingWorkoutsStateHolder,
    this._workoutDataSource,
    this._connectivity,
    this._workoutRemoteDataSource,
  );

  @override
  Future<void> init() async {
    updateList();

    _connectivity.onConnectivityChanged
        .startWith(await _connectivity.checkConnectivity())
        .where(
          (connections) => connections.toSet().intersection({
            ConnectivityResult.ethernet,
            ConnectivityResult.mobile,
            ConnectivityResult.wifi,
          }).isNotEmpty,
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
        await _workoutRemoteDataSource.savePendingWorkout(pendingWorkout);
        _pendingWorkoutsStateHolder.remove(pendingWorkout);
        _workoutDataSource.removePendingWorkout(pendingWorkout);
      } on Object catch (_, __) {}
    }
  }

  @override
  Future<void> dispose() async {}
}
