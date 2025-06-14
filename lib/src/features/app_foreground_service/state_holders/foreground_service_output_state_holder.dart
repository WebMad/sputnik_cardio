import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_output.dart';

class ForegroundServiceOutputStateHolder
    extends StateHolder<ForegroundTaskOutput?> {
  ForegroundServiceOutputStateHolder() : super(null);

  void received(ForegroundTaskOutput output) {
    state = output;
  }
}
