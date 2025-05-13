import 'package:sputnik_cardio/src/features/workout_metrics/models/remote_workout_metrics.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/workout_metrics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkoutMetricsDataSource {
  final SupabaseClient _supabaseClient;

  WorkoutMetricsDataSource(this._supabaseClient);

  Future<void> createMetrics(
    String workoutUuid,
    WorkoutMetrics workoutMetrics,
  ) async {
    final data = RemoteWorkoutMetrics(
      durationMs: workoutMetrics.duration.inMilliseconds,
      avgSpeed: workoutMetrics.avgSpeed,
      kms: workoutMetrics.kms,
      paceMs: workoutMetrics.pace.inMilliseconds,
      workoutUuid: workoutUuid,
    ).toJson();

    await _supabaseClient.from('workout_metrics').insert(data).select();
  }
}
