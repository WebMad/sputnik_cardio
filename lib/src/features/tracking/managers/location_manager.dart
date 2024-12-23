import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

import '../models/pos.dart';

abstract class LocationManager {
  static get moscowPosition => ExtendedPos(
        lat: 55.751244,
        lon: 37.618423,
        alt: 128,
        fetchedAt: DateTime.now(),
      );

  Future<bool> get checkPermissions;

  Future<ExtendedPos> get location;

  ExtendedPos get lastLocation;

  Stream<ExtendedPos> get locationStream;
}
