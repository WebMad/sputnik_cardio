// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_pos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtendedPosImpl _$$ExtendedPosImplFromJson(Map<String, dynamic> json) =>
    _$ExtendedPosImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      alt: (json['alt'] as num).toDouble(),
      fetchedAt: DateTime.parse(json['fetched_at'] as String),
    );

Map<String, dynamic> _$$ExtendedPosImplToJson(_$ExtendedPosImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'alt': instance.alt,
      'fetched_at': instance.fetchedAt.toIso8601String(),
    };
