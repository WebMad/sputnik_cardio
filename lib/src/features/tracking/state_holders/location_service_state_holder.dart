import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/models/location_service_state.dart';

class LocationServiceStateHolder extends StateHolder<LocationServiceState> {
  LocationServiceStateHolder() : super(LocationServiceState.disabled);

  void update(LocationServiceState newState) {
    state = newState;
  }
}
