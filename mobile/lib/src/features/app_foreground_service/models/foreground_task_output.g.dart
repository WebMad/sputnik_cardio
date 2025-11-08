// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreground_task_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      pos: ExtendedPos.fromJson(json['pos'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'pos': instance.pos.toJson(),
      'type': instance.$type,
    };

_$LocationStreamImpl _$$LocationStreamImplFromJson(Map<String, dynamic> json) =>
    _$LocationStreamImpl(
      pos: ExtendedPos.fromJson(json['pos'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LocationStreamImplToJson(
        _$LocationStreamImpl instance) =>
    <String, dynamic>{
      'pos': instance.pos.toJson(),
      'type': instance.$type,
    };
