import 'dart:async';

import 'package:meta/meta.dart';
import 'package:sputnik_di/sputnik_di.dart';

abstract class DepsNode {
  @protected
  R bind<R>(R Function() creator) {
    final object = creator();

    return object;
  }
}

mixin AutoDisposableDepsNode on DepsNode implements Disposable {
  final List<Disposable> disposable = [];

  @override
  R bind<R>(R Function() creator) {
    final dep = super.bind(creator);

    if (dep is Disposable) {
      disposable.add(dep);
    }

    return dep;
  }

  @override
  FutureOr<void> dispose() {
    for (final dep in disposable.reversed) {
      dep.dispose();
    }
  }
}
