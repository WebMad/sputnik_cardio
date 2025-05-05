// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutMetricsImpl _$$WorkoutMetricsImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutMetricsImpl(
      kms: (json['kms'] as num).toDouble(),
      avgSpeed: (json['avgSpeed'] as num).toDouble(),
    );

Map<String, dynamic> _$$WorkoutMetricsImplToJson(
        _$WorkoutMetricsImpl instance) =>
    <String, dynamic>{
      'kms': instance.kms,
      'avgSpeed': instance.avgSpeed,
    };
