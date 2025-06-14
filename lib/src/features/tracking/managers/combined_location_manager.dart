import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_service_status.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/foreground_service_location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/geolocator_location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

class CombinedLocationManager implements LocationManager {
  final GeolocatorLocationManager _geolocatorLocationManager;
  final ForegroundServiceLocationManager _foregroundServiceLocationManager;
  final ForegroundServiceStatusStateHolder _foregroundServiceStatusStateHolder;

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
  Future<bool> get checkPermissions => _actualLocationManager.checkPermissions;

  @override
  ExtendedPos? get lastLocation => _actualLocationManager.lastLocation;

  @override
  Future<ExtendedPos> get location => _actualLocationManager.location;

  @override
  Stream<ExtendedPos> get locationStream =>
      _foregroundServiceStatusStateHolder.stream
          .startWith(_foregroundServiceStatusStateHolder.state)
          .switchMap(
            (_) => _actualLocationManager.locationStream
                .cast<ExtendedPos>()
                .whereNotNull(),
          );
}
