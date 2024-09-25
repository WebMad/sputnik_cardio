import 'package:latlong2/latlong.dart';

class Pos {
  final double lat;
  final double lon;

  const Pos({
    required this.lat,
    required this.lon,
  });
}

extension PosEx on Pos {
  LatLng get latLng => LatLng(lat, lon);
}