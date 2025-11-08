import 'package:sputnik_di/sputnik_di.dart';
import 'package:sputnik_workout_core/sputnik_workout_core.dart';

import 'workout_core_deps_node.dart';

abstract class SputnikWorkoutCoreController implements Lifecycle {
  factory SputnikWorkoutCoreController() => WorkoutCoreDepsNode();

  WorkoutModificationManagerFactory get workoutModificationManagerFactory;
}
