// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      uuid: json['uuid'] as String,
      state: $enumDecode(_$WorkoutStateEnumMap, json['state']),
      segments: (json['segments'] as List<dynamic>)
          .map((e) => WorkoutSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'state': _$WorkoutStateEnumMap[instance.state]!,
      'segments': instance.segments,
    };

const _$WorkoutStateEnumMap = {
  WorkoutState.idle: 'idle',
  WorkoutState.inProcess: 'inProcess',
  WorkoutState.paused: 'paused',
  WorkoutState.stopped: 'stopped',
};
