// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoneWorkoutMetricsImpl _$$DoneWorkoutMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$DoneWorkoutMetricsImpl(
      pace: Duration(microseconds: (json['pace'] as num).toInt()),
      kms: (json['kms'] as num).toDouble(),
      avgSpeed: (json['avgSpeed'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$DoneWorkoutMetricsImplToJson(
        _$DoneWorkoutMetricsImpl instance) =>
    <String, dynamic>{
      'pace': instance.pace.inMicroseconds,
      'kms': instance.kms,
      'avgSpeed': instance.avgSpeed,
      'duration': instance.duration.inMicroseconds,
    };
