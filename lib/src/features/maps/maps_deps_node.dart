import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/maps/managers/maps_centering_manager.dart';
import 'package:sputnik_cardio/src/features/maps/state_holders/map_center_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';

class MapsDepsNode extends DepsNode implements Lifecycle {
  final LocationDepsNode _locationDepsNode;

  late final mapsCenteringManager = bind(
    () => MapsCenteringManager(
      _locationDepsNode.locationManager(),
      mapCenterStateHolder(),
    ),
  );

  late final mapCenterStateHolder = bind(
    () => MapCenterStateHolder(),
  );

  MapsDepsNode(this._locationDepsNode);

  @override
  List<Set<Lifecycle Function()>> get initializeQueue => [
        {
          mapsCenteringManager,
        },
      ];
}
