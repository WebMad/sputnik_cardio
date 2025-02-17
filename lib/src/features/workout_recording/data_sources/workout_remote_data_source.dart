import 'dart:convert';

import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../tracking/models/extended_pos.dart';
import '../../tracking/models/pos.dart';

class WorkoutRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final AuthController _authController;

  WorkoutRemoteDataSource(
    this._supabaseClient,
    this._authController,
  );
  //
  // Future<List<Workout>> list() async {
  //   final userId = _authController.authState.mapOrNull(
  //     authorized: (user) => user.user.mapOrNull(
  //       (value) => value.uuid,
  //     ),
  //   )!;
  //
  //   final workouts = await _supabaseClient
  //       .from('workouts')
  //       .select()
  //       .eq(
  //         'user_id',
  //         userId,
  //       )
  //       .order('created_at');
  //
  //   return workouts.map((e) => Workout.fromJson(e)).toList();
  // }
  //
  // /// сохраняет тренировку в базе данных
  // Future<Workout> create({
  //   required Pos startPos,
  // }) async {
  //   final res = await _supabaseClient.rest
  //       .from('workouts')
  //       .insert({
  //         'start_pos': startPos,
  //         'start_at': DateTime.now().toIso8601String(),
  //         'user_id': _authController.authState.mapOrNull(
  //           authorized: (value) => value.user.mapOrNull((value) => value.uuid),
  //         )!,
  //       })
  //       .select()
  //       .single();
  //
  //   return Workout.fromJson(res);
  // }
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
  // Future<Workout> getById(int id) async {
  //   final res = await _supabaseClient.rest
  //       .from('workouts')
  //       .select()
  //       .eq('id', id)
  //       .single();
  //
  //   return Workout.fromJson(res);
  // }
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
