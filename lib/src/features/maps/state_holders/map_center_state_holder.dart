import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_location/sputnik_location.dart';

import '../../tracking/managers/location_manager.dart';

class MapCenterStateHolder extends StateHolder<ExtendedPos> {
  MapCenterStateHolder() : super(LocationManager.moscowPosition);

  void update(ExtendedPos pos) {
    state = pos;
  }
}
