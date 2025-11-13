import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_service_status.dart';

class ForegroundServiceStatusStateHolder
    extends StateHolder<ForegroundServiceStatus> {
  ForegroundServiceStatusStateHolder() : super(ForegroundServiceStatus.idle);

  void update(ForegroundServiceStatus status) {
    state = status;
  }
}
