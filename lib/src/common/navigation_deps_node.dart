import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/navigation_manager.dart';

class NavigationDepsNode extends DepsNode {
  late final navigationManager = bind(
    () => NavigationManager(),
  );
}
