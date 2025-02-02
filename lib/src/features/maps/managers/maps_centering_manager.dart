import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

import '../state_holders/map_center_state_holder.dart';

enum CenterPositionStrategy {
  centerUserLocation,
  disabled,
}

class MapsCenteringManager implements Lifecycle {
  final LocationManager _locationManager;
  final MapCenterStateHolder _mapCenterStateHolder;

  StreamController<Pos>? _centerPosController;
  Timer? _timer;

  CenterPositionStrategy _centerPositionStrategy =
      CenterPositionStrategy.centerUserLocation;

  MapsCenteringManager(
    this._locationManager,
    this._mapCenterStateHolder,
  );

  @override
  Future<void> init() async => _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => _handleUpdateMap(),
      );

  void onUserInteract() {
    _centerPositionStrategy = CenterPositionStrategy.disabled;
  }

  void onUserLocationTap() {
    _centerPositionStrategy = CenterPositionStrategy.centerUserLocation;
  }

  Future<void> _handleUpdateMap() async {
    if (_centerPositionStrategy == CenterPositionStrategy.centerUserLocation) {
      final location = await _locationManager.location;

      _mapCenterStateHolder.update(location);
    }
  }

  @override
  Future<void> dispose() async {
    _timer?.cancel();
    _timer = null;
  }
}
