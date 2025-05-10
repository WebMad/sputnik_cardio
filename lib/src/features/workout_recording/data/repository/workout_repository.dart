import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_route.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';

import '../../../workout_core/models/workout.dart';

class WorkoutRepository {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;
  final WorkoutDataSource _workoutDataSource;
  final InternetConnectionStateHolder _internetConnectionStateHolder;

  WorkoutRepository(
    this._workoutRemoteDataSource,
    this._workoutTrackDataSource,
    this._workoutDataSource,
    this._internetConnectionStateHolder,
  );

  Future<void> createWorkout(Workout workout) async {
    final routeUuids = workout.segments.map((e) => e.routeUuid);

    final routes = <WorkoutRoute>[];

    for (final routeUuid in routeUuids) {
      final route = await _workoutTrackDataSource.getTrack(routeUuid);
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

    await _workoutDataSource.createPendingWorkout(
      PendingWorkout(
        workout: workout,
        routes: routes,
      ),
    );
  }
}
