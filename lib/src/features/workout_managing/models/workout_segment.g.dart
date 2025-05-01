// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSegmentImpl _$$WorkoutSegmentImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSegmentImpl(
      type: $enumDecode(_$WorkoutSegmentTypeEnumMap, json['type']),
      startAt: DateTime.parse(json['startAt'] as String),
      routeUuid: json['routeUuid'] as String,
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$$WorkoutSegmentImplToJson(
        _$WorkoutSegmentImpl instance) =>
    <String, dynamic>{
      'type': _$WorkoutSegmentTypeEnumMap[instance.type]!,
      'startAt': instance.startAt.toIso8601String(),
      'routeUuid': instance.routeUuid,
      'endAt': instance.endAt?.toIso8601String(),
    };

const _$WorkoutSegmentTypeEnumMap = {
  WorkoutSegmentType.run: 'run',
  WorkoutSegmentType.cycling: 'cycling',
  WorkoutSegmentType.pause: 'pause',
};
