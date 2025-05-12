import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_local_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_track/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

class WorkoutRepository {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutLocalDataSource _workoutLocalDataSource;
  final InternetConnectionStateHolder _internetConnectionStateHolder;

  WorkoutRepository(
    this._workoutRemoteDataSource,
    this._workoutTrackDepsNode,
    this._workoutLocalDataSource,
    this._internetConnectionStateHolder,
  );

  Future<List<Workout>> getActiveWorkouts() async =>
      await _workoutLocalDataSource.getActiveWorkouts();

  void setActiveWorkout(Workout workout) =>
      _workoutLocalDataSource.setActiveWorkout(workout);

  void removeActiveWorkout(Workout workout) {
    _workoutLocalDataSource.removeWorkout(workout.uuid);
  }

  Future<void> createWorkout(Workout workout) async {
    final routeUuids = workout.segments.map((e) => e.routeUuid);

    final routes = <WorkoutRoute>[];

    for (final routeUuid in routeUuids) {
      final route =
          _workoutTrackDepsNode.workoutTrackRepository().getRoute(routeUuid);
      routes.add(
        WorkoutRoute(
          uuid: routeUuid,
          routeData: route,
        ),
      );
    }

    if (_internetConnectionStateHolder.hasInternet) {
      /// TODO тут бы по идее транзакцию применить
      await _workoutRemoteDataSource.createRoutes(routes);
      await _workoutRemoteDataSource.create(workout);
      await _workoutRemoteDataSource.createSegments(
        workout.uuid,
        workout.segments,
      );

      return;
    }

    await _workoutLocalDataSource.createPendingWorkout(
      PendingWorkout(
        workout: workout,
        routes: routes,
      ),
    );
  }
}
