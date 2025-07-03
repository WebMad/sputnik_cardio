import 'package:sputnik_location/sputnik_location.dart';

abstract class LocationManager {
  static get moscowPosition => ExtendedPos(
        lat: 55.751244,
        lon: 37.618423,
        alt: 128,
        fetchedAt: DateTime.now(),
      );

  Future<ExtendedPos> get location;

  ExtendedPos? get lastLocation;

  Stream<ExtendedPos> get locationStream;
}
