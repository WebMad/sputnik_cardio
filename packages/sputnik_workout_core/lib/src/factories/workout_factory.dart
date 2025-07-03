import 'package:uuid/uuid.dart';

import '../models/workout.dart';

class WorkoutFactory {
  final Uuid _uuid;

  WorkoutFactory(this._uuid);

  Workout create() => Workout(
        uuid: _uuid.v4(),
        startAt: DateTime.now(),
        state: WorkoutState.idle,
      );
}
