import 'dart:async';

import 'package:sputnik_di/src/lifecycle/part_of_lifecycle.dart';

abstract class Disposable implements PartOfLifecycle {
  Future<void> dispose();
}
