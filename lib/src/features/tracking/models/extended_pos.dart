import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

part 'extended_pos.freezed.dart';

part 'extended_pos.g.dart';

@freezed
class ExtendedPos with _$ExtendedPos implements Pos {
  const factory ExtendedPos({
    required double lat,
    required double lon,
    required double alt,
    @JsonKey(name: 'fetched_at') required DateTime fetchedAt,
  }) = _ExtendedPos;

  factory ExtendedPos.fromJson(Map<String, dynamic> json) =>
      _$ExtendedPosFromJson(json);
}

extension ExtendedPosEx on ExtendedPos {
  double distanceTo(ExtendedPos other) {
    const earthRadius = 6371; // in kilometers

    final lat1 = _degreesToRadians(lat);
    final lon1 = _degreesToRadians(lon);
    final lat2 = _degreesToRadians(other.lat);
    final lon2 = _degreesToRadians(other.lon);

    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
