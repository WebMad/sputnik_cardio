import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_workout_metrics.freezed.dart';

part 'remote_workout_metrics.g.dart';

@freezed
class RemoteWorkoutMetrics with _$RemoteWorkoutMetrics {
  const factory RemoteWorkoutMetrics({
    @JsonKey(name: 'kms') required double kms,
    @JsonKey(name: 'pace_ms') required int paceMs,
    @JsonKey(name: 'avg_speed') required double avgSpeed,
    @JsonKey(name: 'duration_ms') required int durationMs,
    @JsonKey(name: 'workout_uuid') required String workoutUuid,
  }) = _RemoteWorkoutMetrics;

  factory RemoteWorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$RemoteWorkoutMetricsFromJson(json);
}
