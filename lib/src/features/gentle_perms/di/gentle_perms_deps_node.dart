import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/permissions/location_perm.dart';

import '../managers/gentle_perms_manager.dart';
import '../permissions/ignore_battery_optimizations_perm.dart';
import '../permissions/notifications_perm.dart';
import '../permissions/system_alert_window_perm.dart';
import '../state_holders/actual_perms_state_holder.dart';

class GentlePermsDepsNode extends DepsNode {
  late final gentlePermsManager = bind(
    () => GentlePermsManager(
      {
        _locationPerm(),
        _notificationsPerm(),
        _ignoreBatteryOptimizationsPerm(),
        _systemAlertWindowPerm(),
      },
      actualPermsStateHolder(),
    ),
  );

  late final actualPermsStateHolder = bind(
    () => ActualPermsStateHolder(),
  );

  late final _locationPerm = bind(
    () => LocationPerm(),
  );

  late final _notificationsPerm = bind(
    () => NotificationsPerm(),
  );

  late final _ignoreBatteryOptimizationsPerm = bind(
    () => IgnoreBatteryOptimizationsPerm(),
  );

  late final _systemAlertWindowPerm = bind(
    () => SystemAlertWindowPerm(),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {actualPermsStateHolder},
        {gentlePermsManager},
      ];
}
