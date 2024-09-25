import 'package:sputnik_di/sputnik_di.dart';

import 'tracking_model.dart';

class TrackingHolder extends StateHolder<TrackingModel> {
  TrackingHolder() : super(const TrackingModel.initial());

  bool get isPaused => state.mapOrNull(paused: (value) => true) ?? false;

  bool get isPlayed => state.mapOrNull(played: (value) => true) ?? false;

  bool get isPlayedOrPaused => isPaused || isPlayed;

  bool get isInitial => state.mapOrNull(initial: (value) => true) ?? false;

  void update(TrackingModel model) {
    state = model;
  }
}
