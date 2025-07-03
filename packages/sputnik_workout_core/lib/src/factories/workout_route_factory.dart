import 'package:uuid/uuid.dart';

import '../../sputnik_workout_core.dart';

class WorkoutRouteFactory {
  final Uuid _uuid;

  WorkoutRouteFactory(this._uuid);

  void create() => WorkoutRoute(uuid: _uuid.v4(), routeData: []);
}
