import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm.dart';

import '../state_holders/actual_perms_state_holder.dart';

class GentlePermsManager implements Lifecycle {
  final Set<GentlePerm> initialPerms;
  final ActualPermsStateHolder _actualPermsStateHolder;
  final _perms = <GentlePerm>{};

  GentlePermsManager(
    this.initialPerms,
    this._actualPermsStateHolder,
  );

  Future<void> actualize() async {
    final actualPerms = <GentlePerm>{};
    for (final perm in _perms) {
      final status = await perm.permission.status;

      if ({
        PermissionStatus.limited,
        PermissionStatus.permanentlyDenied,
        PermissionStatus.provisional,
        PermissionStatus.denied,
        PermissionStatus.restricted,
      }.contains(status)) {
        actualPerms.add(perm);
      }
    }
    _actualPermsStateHolder.update(actualPerms);
  }

  Future<void> request(GentlePerm perm) async {
    final status = await perm.permission.status;

    try {
      if ({
        PermissionStatus.limited,
        PermissionStatus.permanentlyDenied,
        PermissionStatus.provisional,
        PermissionStatus.restricted,
      }.contains(status)) {
        await openAppSettings();
        return;
      }

      final res = await perm.permission.request();
      if (res == PermissionStatus.denied) {
        throw Exception('Permission denied');
      }
    } on Object catch (e, st) {
      print(e);
      print(st);
      await openAppSettings();
    } finally {
      await actualize();
    }
  }

  void register(GentlePerm perm) {
    _perms.add(perm);
  }

  void unregister(GentlePerm perm) {
    _perms.remove(perm);
  }

  @override
  Future<void> init() async {
    for (final initialPerm in initialPerms) {
      register(initialPerm);
    }

    await actualize();
  }

  @override
  Future<void> dispose() async {
    for (final perm in _perms.toList().reversed) {
      unregister(perm);
    }
  }
}
