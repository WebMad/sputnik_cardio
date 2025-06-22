import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/state_holders/actual_perms_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/models/location_service_state.dart';
import 'package:sputnik_cardio/src/features/tracking/state_holders/location_service_state_holder.dart';

import '../../app_foreground_service/models/foreground_service_status.dart';
import '../models/extended_pos.dart';
import 'location_manager.dart';

class GeolocatorLocationManager implements LocationManager {
  ExtendedPos? _lastLocation;
  final ForegroundServiceStatusStateHolder _foregroundServiceStatusStateHolder;
  final ActualPermsStateHolder _actualPermsStateHolder;

  final LocationServiceStateHolder _locationServiceStateHolder;

  GeolocatorLocationManager(
    this._foregroundServiceStatusStateHolder,
    this._locationServiceStateHolder,
    this._actualPermsStateHolder,
  );

  @override
  Future<ExtendedPos> get location async {
    await _locationServiceStateHolder.asStream.firstWhere(
      (serviceState) => serviceState == LocationServiceState.enabled,
    );

    final currentLocation = await Geolocator.getCurrentPosition(
      locationSettings: Platform.isAndroid
          ? AndroidSettings(
              forceLocationManager: true,
            )
          : null,
    );

    _lastLocation = currentLocation.pos;

    return currentLocation.pos;
  }

  @override
  Stream<ExtendedPos> get locationStream => Rx.combineLatest3(
        _foregroundServiceStatusStateHolder.asStream,
        _locationServiceStateHolder.asStream,
        _actualPermsStateHolder.asStream,
        (foregroundServiceStatus, locationServiceState, actualPermsState) {
          return foregroundServiceStatus == ForegroundServiceStatus.idle &&
              locationServiceState == LocationServiceState.enabled &&
              _actualPermsStateHolder.isPermGranted(Permission.location);
        },
      ).switchMap(
        (enabled) => enabled
            ? Geolocator.getPositionStream(
                locationSettings: Platform.isAndroid
                    ? AndroidSettings(
                        forceLocationManager: true,
                      )
                    : null,
              ).map((pos) {
                final position = pos.pos;

                _lastLocation = position;

                return position;
              })
            : const Stream.empty(),
      );

  @override
  ExtendedPos? get lastLocation => _lastLocation;
}

extension GeolocatorPositionEx on Position {
  ExtendedPos get pos => ExtendedPos(
        lat: latitude,
        lon: longitude,
        alt: altitude,
        fetchedAt: timestamp,
      );
}
