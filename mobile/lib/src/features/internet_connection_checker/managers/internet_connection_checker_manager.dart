import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/models/internet_connection_state.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';

class InternetConnectionCheckerManager implements Lifecycle {
  final InternetConnectionStateHolder _internetConnectionStateHolder;

  StreamSubscription<InternetConnectionStatus>? _sub;

  InternetConnectionCheckerManager(this._internetConnectionStateHolder);

  @override
  Future<void> init() async {
    _init();
  }

  Future<void> _init() async {
    final internetConnectionChecker = InternetConnectionChecker.instance;
    _sub = internetConnectionChecker.onStatusChange
        .startWith(await internetConnectionChecker.connectionStatus)
        .listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _internetConnectionStateHolder
              .update(InternetConnectionState.available);
        case InternetConnectionStatus.disconnected:
          _internetConnectionStateHolder
              .update(InternetConnectionState.notAvailable);
        case InternetConnectionStatus.slow:
          _internetConnectionStateHolder.update(InternetConnectionState.slow);
      }
    });
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
