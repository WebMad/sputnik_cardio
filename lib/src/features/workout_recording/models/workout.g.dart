// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num).toInt(),
      startPos: Pos.fromJson(json['start_pos'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
      status: $enumDecode(_$WorkoutStateEnumMap, json['status']),
      endPos: json['end_pos'] == null
          ? null
          : Pos.fromJson(json['end_pos'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      stopAt: json['stop_at'] == null
          ? null
          : DateTime.parse(json['stop_at'] as String),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_pos': instance.startPos,
      'user_id': instance.userId,
      'status': _$WorkoutStateEnumMap[instance.status]!,
      'end_pos': instance.endPos,
      'created_at': instance.createdAt.toIso8601String(),
      'start_at': instance.startAt?.toIso8601String(),
      'stop_at': instance.stopAt?.toIso8601String(),
    };

const _$WorkoutStateEnumMap = {
  WorkoutState.started: 'started',
  WorkoutState.paused: 'paused',
  WorkoutState.stopped: 'stopped',
};
