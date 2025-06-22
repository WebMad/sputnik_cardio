import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_input.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_output.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

import '../../app_foreground_service/managers/foreground_execute_manager.dart';
import '../../app_foreground_service/state_holders/foreground_service_output_state_holder.dart';

class ForegroundServiceLocationManager extends StateHolder<ExtendedPos?>
    implements LocationManager {
  final ForegroundServiceOutputStateHolder _foregroundServiceOutputStateHolder;
  final ForegroundExecuteManager _foregroundExecuteManager;

  StreamSubscription<ForegroundTaskOutput?>? _sub;
  Completer<ExtendedPos>? _locationCompleter;

  ForegroundServiceLocationManager(
    this._foregroundServiceOutputStateHolder,
    this._foregroundExecuteManager,
  ) : super(null);

  @override
  Future<void> init() {
    _sub = _foregroundServiceOutputStateHolder.stream.whereNotNull().where(
      (event) {
        return event.maybeMap(
          locationStream: (value) => true,
          location: (value) => true,
          orElse: () => false,
        );
      },
    ).listen((event) {
      event.mapOrNull(
        location: (value) {
          _locationCompleter?.complete(event.pos);
          _locationCompleter = null;
        },
      );

      update(event.pos);
    });

    return super.init();
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;

    return super.dispose();
  }

  void update(ExtendedPos pos) {
    state = pos;
  }

  @override
  ExtendedPos? get lastLocation => state;

  @override
  Future<ExtendedPos> get location async {
    try {
      final completer = _locationCompleter;
      if (completer != null) {
        return await completer.future.timeout(const Duration(seconds: 10));
      }

      final newCompleter = _locationCompleter = Completer<ExtendedPos>();

      _foregroundExecuteManager.execute(const ForegroundTaskInput.location());

      return await newCompleter.future.timeout(const Duration(seconds: 10));
    } on TimeoutException catch (e, st) {
      print(e);
      print(st);
    }
    return lastLocation ?? (throw Exception('Cannot get location'));
  }

  @override
  Stream<ExtendedPos> get locationStream => stream.whereNotNull();
}
