import 'package:latlong2/latlong.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos.freezed.dart';
part 'pos.g.dart';

abstract class Pos {
  double get lat;
  double get lon;
}

@freezed
class LatLonPos with _$LatLonPos implements Pos {
  const factory LatLonPos({
    required double lat,
    required double lon,
  }) = _LatLonPos;

  factory LatLonPos.fromJson(Map<String, dynamic> json) =>
      _$LatLonPosFromJson(json);
}

extension PosEx on Pos {
  LatLng get latLng => LatLng(lat, lon);
}