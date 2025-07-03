import 'package:sputnik_di/sputnik_di.dart';

import '../models/models.dart';
import '../providers/workout_provider.dart';

class WorkoutStateHolder extends StateHolder<Workout>
    implements WorkoutProvider {
  WorkoutStateHolder(super.state);

  void update(Workout workout) {
    state = workout;
  }

  @override
  Workout get workout => state;

  @override
  Stream<Workout> get workoutStream => stream;
}
