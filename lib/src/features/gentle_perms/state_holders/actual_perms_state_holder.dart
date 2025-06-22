import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm.dart';

class ActualPermsStateHolder extends StateHolder<Set<GentlePerm>> {
  ActualPermsStateHolder() : super(<GentlePerm>{});

  void update(Set<GentlePerm> perms) {
    state = perms;
  }
}
