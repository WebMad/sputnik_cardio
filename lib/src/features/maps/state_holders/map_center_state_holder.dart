import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

import '../../tracking/managers/location_manager.dart';

class MapCenterStateHolder extends StateHolder<Pos> {
  MapCenterStateHolder() : super(LocationManager.moscowPosition);

  void update(Pos pos) {
    state = pos;
  }
}
