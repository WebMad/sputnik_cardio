import 'dart:convert';

import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/done_workout_metrics.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/workout_metrics.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../tracking/models/extended_pos.dart';
import '../../../workout_metrics/models/remote_workout_metrics.dart';

class WorkoutRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final AuthController _authController;

  WorkoutRemoteDataSource(
    this._supabaseClient,
    this._authController,
  );

  Future<List<DetailedWorkout>> list() async {
    final workouts = await _supabaseClient.from('workouts').select('''
          *,
          workout_segments (
            *,
            workout_routes (
              *
            )
          ),
          workout_metrics (
            *
          )
        ''').order('created_at');

    final Map<String, List<ExtendedPos>> routesMap = {};

    return workouts.map((e) {
      Workout workout = Workout.fromJson(e);
      final segments =
          (e['workout_segments'] as List<dynamic>?)?.map((segment) {
        final segmentJson = segment as Map<String, dynamic>;
        final workoutSegment = WorkoutSegment.fromJson(segmentJson);

        final routeData =
            segmentJson['workout_routes'] as Map<String, dynamic>?;

        if (routeData != null) {
          final route = WorkoutRoute.fromJson(routeData);
          routesMap[route.uuid] = route.routeData;
        }
        return workoutSegment;
      }).toList();

      workout = workout.copyWith(segments: segments ?? []);

      final rawMetricsList = e['workout_metrics'] as List<dynamic>;

      final metrics = rawMetricsList.isNotEmpty
          ? DoneWorkoutMetrics.fromRemote(
              RemoteWorkoutMetrics.fromJson(
                rawMetricsList.last as Map<String, dynamic>,
              ),
            )
          : null;

      return DetailedWorkout(
        workout: workout,
        routes: routesMap,
        metrics: metrics,
      );
    }).toList();
  }

  /// сохраняет тренировку в базе данных
  Future<Workout> create(Workout workout) async {
    final res = await _supabaseClient.rest
        .from('workouts')
        .insert({
          'uuid': workout.uuid,
          'start_at': workout.startAt.toIso8601String(),
          'stop_at': workout.stopAt?.toIso8601String(),
          'state': workout.state.name,
        })
        .select()
        .single();

    final createdWorkout = Workout.fromJson(res);

    return createdWorkout;
  }

  Future<void> createSegments(
    String workoutUuid,
    List<WorkoutSegment> segments,
  ) async {
    final segmentsJson = segments.map((segment) {
      final segmentJson = segment.toJson();
      segmentJson['workout_uuid'] = workoutUuid;
      return segmentJson;
    }).toList();

    await _supabaseClient.rest.from('workout_segments').insert(segmentsJson);
  }

  Future<void> createRoutes(List<WorkoutRoute> routes) async {
    final routesJson = routes
        .map((route) => {
              'uuid': route.uuid,
              'route_data': route.routeData.map((pos) => pos.toJson()).toList(),
            })
        .toList();

    await _supabaseClient.rest.from('workout_routes').insert(routesJson);
  }

//
// Future<Workout> update(Workout workout) async {
//   final res = await _supabaseClient.rest
//       .from('workouts')
//       .update(workout.toJson())
//       .eq('id', workout.id)
//       .select()
//       .single();
//
//   return Workout.fromJson(res);
// }
//
  Future<void> deleteWorkout(String workoutUuid) async {
    await _supabaseClient.from('workouts').delete().eq('uuid', workoutUuid);
  }

  Future<Workout> getByUuid(String uuid) async {
    final res = await _supabaseClient.rest
        .from('workouts')
        .select()
        .eq('uuid', uuid)
        .single();

    return Workout.fromJson(res);
  }
//
// Future<void> removeWorkout(int workoutId) async {
//   await _supabaseClient.rest.from('workouts').delete().eq('id', workoutId);
// }
//
// Future<void> recordWorkoutCoord(int id, ExtendedPos pos) async {
//   await _supabaseClient.rest.from('workout_coords').insert({
//     'workout_id': id,
//     'lat': pos.lat,
//     'lon': pos.lon,
//     'alt': pos.alt,
//     'fetched_at': pos.fetchedAt.toIso8601String(),
//   });
// }
//
// Future<void> createWorkoutMetrics(WorkoutMetrics workoutsMetrics) async {
//   await _supabaseClient.rest
//       .from('workout_metrics')
//       .insert(workoutsMetrics.toJson());
// }
//
// Future<WorkoutMetrics> workoutMetrics(int workoutId) async {
//   final workoutMetric = await _supabaseClient.rest
//       .from('workout_metrics')
//       .select()
//       .eq('workout_id', workoutId)
//       .single();
//
//   return WorkoutMetrics.fromJson(workoutMetric);
// }
//
// Future<List<ExtendedPos>> getWorkoutCoords(int workoutId) async {
//   final workoutCoords = await _supabaseClient.rest
//       .from('workout_coords')
//       .select()
//       .eq('workout_id', workoutId);
//
//   return workoutCoords.map((e) => ExtendedPos.fromJson(e)).toList();
// }
}
