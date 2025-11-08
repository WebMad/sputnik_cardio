import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/managers/internet_connection_checker_manager.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';

class InternetConnectionCheckerDepsNode extends DepsNode {
  late final _internetConnectionCheckerManager = bind(
    () => InternetConnectionCheckerManager(
      internetConnectionCheckerStateHolder(),
    ),
  );

  late final internetConnectionCheckerStateHolder = bind(
    () => InternetConnectionStateHolder(),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          internetConnectionCheckerStateHolder,
        },
        {
          _internetConnectionCheckerManager,
        }
      ];
}
