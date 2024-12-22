import 'package:latlong2/latlong.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos.freezed.dart';
part 'pos.g.dart';

@freezed
class Pos with _$Pos {
  const factory Pos({
    required double lat,
    required double lon,
  }) = _Pos;

  factory Pos.fromJson(Map<String, dynamic> json) =>
      _$PosFromJson(json);
}

extension PosEx on Pos {
  LatLng get latLng => LatLng(lat, lon);
}