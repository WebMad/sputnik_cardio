import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';
import 'package:uuid/uuid.dart';

class WorkoutManagingDepsNode extends DepsNode {
  late final workoutManager = bind(() => WorkoutManager(const Uuid()));
}
