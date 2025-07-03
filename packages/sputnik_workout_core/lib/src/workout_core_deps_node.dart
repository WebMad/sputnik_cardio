import 'package:sputnik_di/sputnik_di.dart';
import 'package:sputnik_workout_core/src/managers/workout_modification_manager.dart';
import 'package:sputnik_workout_core/src/sputnik_workout_core_controller.dart';
import 'package:uuid/uuid.dart';

import 'factories/factories.dart';

class WorkoutCoreDepsNode extends DepsNode
    implements SputnikWorkoutCoreController {
  late final _uuid = bind(() => const Uuid());

  late final _workoutSegmentFactory = bind(
    () => WorkoutSegmentFactory(_uuid()),
  );

  late final _workoutFactory = bind(() => WorkoutFactory(_uuid()));

  late final _workoutModificationManagerFactory = bind(() {
    return WorkoutModificationManagerFactory(
      _workoutFactory(),
      _workoutSegmentFactory(),
      _uuid(),
    );
  });

  @override
  WorkoutModificationManagerFactory get workoutModificationManagerFactory =>
      _workoutModificationManagerFactory();
}
