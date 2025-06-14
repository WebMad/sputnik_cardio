import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/di/app_foreground_service_deps_node.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/current_location_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/combined_location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/foreground_service_location_manager.dart';

import 'location_data_marker_impl.dart';
import 'managers/geolocator_location_manager.dart';
import 'managers/location_init_manager.dart';

class LocationDepsNode extends DepsNode {
  final AppForegroundServiceDepsNode _foregroundServiceDepsNode;

  late final locationManager = bind(
    () => CombinedLocationManager(
      _geolocatorManager(),
      _foregroundServiceLocationManager(),
      _foregroundServiceDepsNode.foregroundServiceStatusStateHolder(),
    ),
  );

  late final _geolocatorManager = bind(
    () => GeolocatorLocationManager(
      _foregroundServiceDepsNode.foregroundServiceStatusStateHolder(),
    ),
  );

  late final _foregroundServiceLocationManager = bind(
    () => ForegroundServiceLocationManager(
      _foregroundServiceDepsNode.foregroundServiceOutputStateHolder(),
      _foregroundServiceDepsNode.foregroundExecuteManager(),
    ),
  );

  late final locationDataMarker =
      bind<LocationDataMarker>(() => LocationDataMarkerImpl(locationManager()));

  late final locationInitManager = bind(
    () => LocationInitManager(
      locationManager(),
    ),
  );

  LocationDepsNode(this._foregroundServiceDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          _foregroundServiceLocationManager,
        },
        {
          locationInitManager,
        },
      ];
}
