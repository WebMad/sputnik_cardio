import 'package:sputnik_cardio/src/features/maps/widgets/current_location_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_di/sputnik_di.dart';

import 'location_data_marker_impl.dart';
import 'managers/geolocator_location_manager.dart';

class LocationDepsNode extends DepsNode {
  late final locationManager =
      bind<LocationManager>(() => GeolocatorLocationManager());

  late final locationDataMarker =
      bind<LocationDataMarker>(() => LocationDataMarkerImpl(locationManager()));
}
