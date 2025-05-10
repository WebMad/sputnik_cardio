import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../models/internet_connection_state.dart';

class InternetConnectionStateHolder
    extends StateHolder<InternetConnectionState> {
  InternetConnectionStateHolder() : super(InternetConnectionState.loading);

  void update(InternetConnectionState newState) {
    state = newState;
  }

  bool get hasInternet => {
        InternetConnectionState.slow,
        InternetConnectionState.available,
      }.contains(state);
}
