import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_route.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';

import '../../../workout_managing/models/workout.dart';

class WorkoutRepository {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;

  WorkoutRepository(
    this._workoutRemoteDataSource,
    this._workoutTrackDataSource,
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

    /// TODO тут бы по идее транзакцию применить
    await _workoutRemoteDataSource.createRoutes(routes);

    await _workoutRemoteDataSource.create(workout);

    await _workoutRemoteDataSource.createSegments(
      workout.uuid,
      workout.segments,
    );
  }
}
