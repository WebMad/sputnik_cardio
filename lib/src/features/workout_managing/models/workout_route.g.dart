// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutRouteImpl _$$WorkoutRouteImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutRouteImpl(
      uuid: json['uuid'] as String,
      poses: (json['poses'] as List<dynamic>)
          .map((e) => ExtendedPos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutRouteImplToJson(_$WorkoutRouteImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'poses': instance.poses,
    };
