import 'dart:async';

import 'package:sputnik_di/src/lifecycle/part_of_lifecycle.dart';

abstract class Initializable implements PartOfLifecycle {
  Future<void> init();
}
