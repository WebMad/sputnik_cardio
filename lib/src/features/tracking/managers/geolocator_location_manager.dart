import 'dart:async';
import 'dart:io';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';

import '../../app_foreground_service/models/foreground_service_status.dart';
import '../models/extended_pos.dart';
import 'location_manager.dart';

class GeolocatorLocationManager implements LocationManager {
  ExtendedPos? _lastLocation;
  final ForegroundServiceStatusStateHolder _foregroundServiceStatusStateHolder;

  GeolocatorLocationManager(
    this._foregroundServiceStatusStateHolder,
  );

  @override
  Future<bool> get checkPermissions async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      /// todo: надо делать логи
      return false;
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// todo: надо делать логи
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      /// todo: надо делать логи
      return false;
    }

    return true;
  }

  @override
  Future<ExtendedPos> get location async {
    final res = await checkPermissions;

    if (res) {
      final currentPosition = (await Geolocator.getCurrentPosition(
        locationSettings: Platform.isAndroid
            ? AndroidSettings(
                forceLocationManager: true,
              )
            : null,
      ))
          .pos;

      _lastLocation = currentPosition;

      return currentPosition;
    }

    /// todo: надо делать логи
    return LocationManager.moscowPosition;
  }

  @override
  Stream<ExtendedPos> get locationStream {
    return _foregroundServiceStatusStateHolder.asStream.switchMap(
      (status) => status == ForegroundServiceStatus.idle
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
  }

  @override
  ExtendedPos get lastLocation =>
      _lastLocation ?? LocationManager.moscowPosition;
}

extension GeolocatorPositionEx on Position {
  ExtendedPos get pos => ExtendedPos(
        lat: latitude,
        lon: longitude,
        alt: altitude,
        fetchedAt: timestamp,
      );
}
