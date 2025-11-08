import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/remote_workout_metrics.dart';

part 'done_workout_metrics.freezed.dart';

part 'done_workout_metrics.g.dart';

@freezed
class DoneWorkoutMetrics with _$DoneWorkoutMetrics {
  const factory DoneWorkoutMetrics({
    required Duration pace,
    required double kms,
    required double avgSpeed,
    required Duration duration,
  }) = _DoneWorkoutMetrics;

  factory DoneWorkoutMetrics.fromRemote(RemoteWorkoutMetrics metrics) =>
      DoneWorkoutMetrics(
        pace: Duration(milliseconds: metrics.paceMs),
        kms: metrics.kms,
        avgSpeed: metrics.avgSpeed,
        duration: Duration(milliseconds: metrics.durationMs),
      );

  factory DoneWorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$DoneWorkoutMetricsFromJson(json);
}
