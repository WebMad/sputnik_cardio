import 'dart:convert';

import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../tracking/models/pos.dart';

class WorkoutRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final AuthController _authController;

  WorkoutRemoteDataSource(
    this._supabaseClient,
    this._authController,
  );

  Future<List<Workout>> list() async {
    final userId = _authController.authState.mapOrNull(
      authorized: (user) => user.user.mapOrNull(
        (value) => value.uuid,
      ),
    )!;

    final workouts = await _supabaseClient.from('workouts').select().eq(
          'user_id',
          userId,
        );

    return workouts.map((e) => Workout.fromJson(e)).toList();
  }

  /// сохраняет тренировку в базе данных
  Future<Workout> create({
    required Pos startPos,
  }) async {
    final res = await _supabaseClient.rest
        .from('workouts')
        .insert({
          'start_pos': startPos,
          'start_at': DateTime.now().toIso8601String(),
          'user_id': _authController.authState.mapOrNull(
            authorized: (value) => value.user.mapOrNull((value) => value.uuid),
          )!,
        })
        .select()
        .single();

    return Workout.fromJson(res);
  }

  Future<Workout> update(Workout workout) async {
    final res = await _supabaseClient.rest
        .from('workouts')
        .update(workout.toJson())
        .eq('id', workout.id)
        .select()
        .single();

    return Workout.fromJson(res);
  }

  Future<Workout> getById(int id) async {
    final res = await _supabaseClient.rest
        .from('workouts')
        .select()
        .eq('id', id)
        .single();

    return Workout.fromJson(res);
  }

  Future<void> recordWorkoutCoord(int id, Pos pos) async {
    await _supabaseClient.rest.from('workout_coords').insert({
      'workout_id': id,
      'lat': pos.lat,
      'lon': pos.lon,
    });
  }
}
