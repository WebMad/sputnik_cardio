import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/managers/workout_modification_manager.dart';
import 'package:uuid/uuid.dart';

class WorkoutCoreDepsNode extends DepsNode {
  late final _uuid = bind(() => const Uuid());

  late final _workoutSegmentFactory = bind(
    () => WorkoutSegmentFactory(_uuid()),
  );

  late final _workoutFactory = bind(
    () => WorkoutFactory(_uuid()),
  );

  late final workoutModificationManager = bind(
    () => WorkoutModificationManager(
      _uuid(),
      _workoutSegmentFactory(),
      _workoutFactory(),
    ),
  );
}
