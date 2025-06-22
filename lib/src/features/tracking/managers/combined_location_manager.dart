import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_service_status.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/foreground_service_location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/geolocator_location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

import '../models/location_service_state.dart';
import '../state_holders/location_service_state_holder.dart';

class CombinedLocationManager implements LocationManager {
  final GeolocatorLocationManager _geolocatorLocationManager;
  final ForegroundServiceLocationManager _foregroundServiceLocationManager;
  final ForegroundServiceStatusStateHolder _foregroundServiceStatusStateHolder;

  ExtendedPos? _lastLocation;

  CombinedLocationManager(
    this._geolocatorLocationManager,
    this._foregroundServiceLocationManager,
    this._foregroundServiceStatusStateHolder,
  );

  LocationManager get _actualLocationManager => const {
        ForegroundServiceStatus.started,
      }.contains(_foregroundServiceStatusStateHolder.state)
          ? _foregroundServiceLocationManager
          : _geolocatorLocationManager;

  @override
  ExtendedPos? get lastLocation => _lastLocation;

  @override
  Future<ExtendedPos> get location => _actualLocationManager.location;

  @override
  Stream<ExtendedPos> get locationStream => Rx.combineLatest2(
        _foregroundServiceLocationManager.locationStream
            .cast<ExtendedPos?>()
            .startWith(_foregroundServiceLocationManager.lastLocation),
        _geolocatorLocationManager.locationStream
            .cast<ExtendedPos?>()
            .startWith(_geolocatorLocationManager.lastLocation),
        (foregroundPos, geolocatorPos) {
          if (foregroundPos == null) {
            return geolocatorPos;
          }

          if (geolocatorPos == null) {
            return foregroundPos;
          }

          return foregroundPos.fetchedAt.compareTo(geolocatorPos.fetchedAt) >= 0
              ? foregroundPos
              : geolocatorPos;
        },
      ).whereNotNull().map((pos) {
        _lastLocation = pos;
        return pos;
      });
}
