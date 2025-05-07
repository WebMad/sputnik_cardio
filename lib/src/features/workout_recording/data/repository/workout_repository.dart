import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_route.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';

import '../../../workout_managing/models/workout.dart';

class WorkoutRepository {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;
  final WorkoutDataSource _workoutDataSource;
  final Connectivity _connectivity;

  WorkoutRepository(
    this._workoutRemoteDataSource,
    this._workoutTrackDataSource,
    this._workoutDataSource,
    this._connectivity,
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

    final hasInternetConnection =
        (await _connectivity.checkConnectivity()).toSet().intersection({
      ConnectivityResult.wifi,
      ConnectivityResult.mobile,
      ConnectivityResult.ethernet,
    }).isNotEmpty;

    if (hasInternetConnection) {
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
