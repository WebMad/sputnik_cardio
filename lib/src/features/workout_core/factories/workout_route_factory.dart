import 'package:sputnik_cardio/src/features/workout_core/models/workout_route.dart';
import 'package:uuid/uuid.dart';

class WorkoutRouteFactory {
  final Uuid _uuid;

  WorkoutRouteFactory(this._uuid);

  void create() => WorkoutRoute(
        uuid: _uuid.v4(),
        routeData: [],
      );
}
