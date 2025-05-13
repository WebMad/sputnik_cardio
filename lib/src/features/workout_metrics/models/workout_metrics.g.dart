// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutMetricsImpl _$$WorkoutMetricsImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutMetricsImpl(
      pace: Duration(microseconds: (json['pace'] as num).toInt()),
      paceLastKm: Duration(microseconds: (json['paceLastKm'] as num).toInt()),
      kms: (json['kms'] as num).toDouble(),
      avgSpeed: (json['avgSpeed'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$WorkoutMetricsImplToJson(
        _$WorkoutMetricsImpl instance) =>
    <String, dynamic>{
      'pace': instance.pace.inMicroseconds,
      'paceLastKm': instance.paceLastKm.inMicroseconds,
      'kms': instance.kms,
      'avgSpeed': instance.avgSpeed,
      'speed': instance.speed,
      'duration': instance.duration.inMicroseconds,
    };
