import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

import 'managers/workout_metrics_manager.dart';
import '../workout_recording/metrics_calculators/avg_speed_calculator.dart';
import '../workout_recording/metrics_calculators/km_metric_calculator.dart';
import '../workout_recording/metrics_calculators/speed_calculator.dart';
import '../workout_recording/metrics_calculators/time_calculator.dart';
import '../workout_recording/state_holders/workout_metrics_state_holder.dart';

abstract interface class WorkoutMetricsParent {
  PersistentWorkoutStateHolder get persistentWorkoutStateHolder;

  WorkoutTrackDepsNode get workoutTrackDepsNode;
}

class WorkoutMetricsDepsNode extends DepsNode {
  final WorkoutMetricsParent _parent;

  late final speedCalculator = bind(
    () => SpeedCalculator(
      (String routeUuid) =>
          _parent.workoutTrackDepsNode.trackProvider(routeUuid),
    ),
  );

  late final kmMetricCalculator = bind(
    () => KmMetricCalculator(
      (String routeUuid) =>
          _parent.workoutTrackDepsNode.trackProvider(routeUuid),
    ),
  );

  late final avgSpeedCalculator = bind(
    () => const AvgSpeedCalculator(),
  );

  late final timeCalculator = bind(
    () => TimeCalculator(),
  );

  late final workoutMetricsManager = bind(
    () => WorkoutMetricsManager(
      _parent.persistentWorkoutStateHolder,
      (String routeUuid) =>
          _parent.workoutTrackDepsNode.trackProvider(routeUuid),
      kmMetricCalculator(),
      workoutMetricsStateHolder(),
      avgSpeedCalculator(),
      speedCalculator(),
      timeCalculator(),
    ),
  );

  late final workoutMetricsStateHolder = bind(
    () => WorkoutMetricsStateHolder(),
  );

  WorkoutMetricsDepsNode(this._parent);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutMetricsStateHolder,
        },
        {
          workoutMetricsManager,
        },
      ];
}
