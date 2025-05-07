// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingWorkoutImpl _$$PendingWorkoutImplFromJson(Map<String, dynamic> json) =>
    _$PendingWorkoutImpl(
      workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
      routes: (json['routes'] as List<dynamic>)
          .map((e) => WorkoutRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PendingWorkoutImplToJson(
        _$PendingWorkoutImpl instance) =>
    <String, dynamic>{
      'workout': instance.workout,
      'routes': instance.routes,
    };
