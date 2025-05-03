// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailedWorkoutImpl _$$DetailedWorkoutImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailedWorkoutImpl(
      workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
      routes: (json['routes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ExtendedPos.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$DetailedWorkoutImplToJson(
        _$DetailedWorkoutImpl instance) =>
    <String, dynamic>{
      'workout': instance.workout,
      'routes': instance.routes,
    };
