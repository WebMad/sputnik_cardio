// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSegmentImpl _$$WorkoutSegmentImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSegmentImpl(
      uuid: json['uuid'] as String,
      type: $enumDecode(_$WorkoutSegmentTypeEnumMap, json['type']),
      startAt: DateTime.parse(json['start_at'] as String),
      routeUuid: json['route_uuid'] as String,
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
    );

Map<String, dynamic> _$$WorkoutSegmentImplToJson(
        _$WorkoutSegmentImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'type': _$WorkoutSegmentTypeEnumMap[instance.type]!,
      'start_at': instance.startAt.toIso8601String(),
      'route_uuid': instance.routeUuid,
      'end_at': instance.endAt?.toIso8601String(),
    };

const _$WorkoutSegmentTypeEnumMap = {
  WorkoutSegmentType.run: 'run',
  WorkoutSegmentType.cycling: 'cycling',
  WorkoutSegmentType.pause: 'pause',
};
