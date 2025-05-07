import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_screen_state_holder.dart';

import 'managers/workout_screen_manager.dart';

class WorkoutInfoScreenDepsNode extends DepsNode {
  final DetailedWorkout _detailedWorkout;

  late final workoutTrackProvider = bindSingletonFactory(
    (String routeUuid) => WorkoutTrackProvider(),
  );

  WorkoutInfoScreenDepsNode(this._detailedWorkout);

  late final workoutScreenStateHolder = bind(
    () => WorkoutScreenStateHolder(_detailedWorkout),
  );

  late final workoutScreenManager = bind(
    () => WorkoutScreenManager(
      workoutScreenStateHolder(),
      (String routeUuid) => workoutTrackProvider(routeUuid),
    ),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutScreenStateHolder,
        },
        {
          workoutScreenManager,
        }
      ];
}
