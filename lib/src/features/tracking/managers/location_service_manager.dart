import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/tracking/models/location_service_state.dart';

import '../state_holders/location_service_state_holder.dart';

class LocationServiceManager implements Lifecycle {
  final LocationServiceStateHolder _locationServiceStateHolder;

  StreamSubscription? _serviceStatusSub;

  LocationServiceManager(this._locationServiceStateHolder);

  @override
  Future<void> init() async {
    _serviceStatusSub = Geolocator.getServiceStatusStream()
        .map((event) => event == ServiceStatus.enabled)
        .startWith(await Geolocator.isLocationServiceEnabled())
        .listen(
          (enabled) => _locationServiceStateHolder.update(
            enabled
                ? LocationServiceState.enabled
                : LocationServiceState.disabled,
          ),
        );
  }

  @override
  Future<void> dispose() async {
    await _serviceStatusSub?.cancel();
    _serviceStatusSub = null;
  }
}
