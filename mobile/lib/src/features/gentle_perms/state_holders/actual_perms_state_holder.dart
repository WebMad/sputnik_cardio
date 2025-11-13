import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm.dart';

class ActualPermsStateHolder extends StateHolder<Set<GentlePerm>> {
  ActualPermsStateHolder() : super(<GentlePerm>{});

  void update(Set<GentlePerm> perms) {
    state = perms;
  }

  bool isPermGranted(Permission permission) =>
      !state.map((perm) => perm.permission).contains(permission);
}
