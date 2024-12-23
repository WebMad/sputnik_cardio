import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

import '../maps/widgets/current_location_layer.dart';

class LocationDataMarkerImpl implements LocationDataMarker {
  final LocationManager _locationManager;

  LocationDataMarkerImpl(this._locationManager);

  @override
  Pos get location => _locationManager.lastLocation;

  @override
  Stream<Pos> get locationStream => _locationManager.locationStream;
}
