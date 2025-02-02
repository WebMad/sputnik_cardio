import 'dart:async';

import 'package:sputnik_cardio/src/features/maps/widgets/current_location_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';
import 'package:sputnik_di/sputnik_di.dart';

import 'location_data_marker_impl.dart';
import 'managers/geolocator_location_manager.dart';
import 'presentation/presenters/tracking_presenter/tracking_holder.dart';
import 'presentation/presenters/tracking_presenter/tracking_presenter.dart';

class TrackingDepsNode extends DepsNode {
  final TrackingDataDepsNode _trackingDataDepsNode;
  final LocationDepsNode _locationDepsNode;
  final WorkoutLifecycleDepsNode _workoutLifecycleDepsNode;

  late final trackingPresenter = bind(
    () => TrackingPresenter(
      _trackingDataDepsNode.trackingHolder(),
      _workoutLifecycleDepsNode.workoutLifecycleManager(),
    ),
  );

  TrackingDepsNode(
    this._trackingDataDepsNode,
    this._locationDepsNode,
    this._workoutLifecycleDepsNode,
  );
}

class TrackingDataDepsNode extends DepsNode {
  late final trackingHolder = bind(() => TrackingHolder());
}

class LocationDepsNode extends DepsNode {
  late final locationManager =
      bind<LocationManager>(() => GeolocatorLocationManager());

  late final locationDataMarker =
      bind<LocationDataMarker>(() => LocationDataMarkerImpl(locationManager()));
}
