import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/managers/app_foreground_service_manager.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';

import '../managers/foreground_execute_manager.dart';
import '../state_holders/foreground_service_output_state_holder.dart';

class AppForegroundServiceDepsNode extends DepsNode {
  late final foregroundExecuteManager = bind(
    () => ForegroundExecuteManager(),
  );

  late final appForegroundServiceManager = bind(
    () => AppForegroundServiceManager(
      foregroundServiceStatusStateHolder(),
      foregroundServiceOutputStateHolder(),
    ),
  );

  late final foregroundServiceStatusStateHolder = bind(
    () => ForegroundServiceStatusStateHolder(),
  );

  late final foregroundServiceOutputStateHolder = bind(
    () => ForegroundServiceOutputStateHolder(),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          appForegroundServiceManager,
        }
      ];
}
