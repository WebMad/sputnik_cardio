import 'package:geolocator/geolocator.dart';

import '../models/extended_pos.dart';
import '../models/pos.dart';
import 'location_manager.dart';

class GeolocatorLocationManager implements LocationManager {
  ExtendedPos? _lastLocation;

  @override
  Future<bool> get checkPermissions async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      /// todo: надо делать логи
      return false;
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// todo: надо делать логи
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      /// todo: надо делать логи
      return false;
    }

    return true;
  }

  @override
  Future<ExtendedPos> get location async {
    final res = await checkPermissions;

    if (res) {
      return (await Geolocator.getCurrentPosition()).pos;
    }

    /// todo: надо делать логи
    return LocationManager.moscowPosition;
  }

  @override
  Stream<ExtendedPos> get locationStream async* {
    final res = await checkPermissions;

    if (res) {
      yield* Geolocator.getPositionStream().map((pos) {
        final position = pos.pos;

        _lastLocation = position;

        return position;
      });
      return;
    }

    /// todo: надо делать логи
    yield* Stream.value(LocationManager.moscowPosition);
  }

  @override
  ExtendedPos get lastLocation =>
      _lastLocation ?? LocationManager.moscowPosition;
}

extension on Position {
  ExtendedPos get pos => ExtendedPos(
        lat: latitude,
        lon: longitude,
        alt: altitude,
        fetchedAt: DateTime.now(),
      );
}
