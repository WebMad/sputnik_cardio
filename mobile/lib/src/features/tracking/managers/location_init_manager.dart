import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';

class LocationInitManager implements Lifecycle {
  final LocationManager _locationManager;

  const LocationInitManager(this._locationManager);

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}
}
