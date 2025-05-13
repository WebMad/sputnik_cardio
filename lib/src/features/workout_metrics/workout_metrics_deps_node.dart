import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/last_km_pace_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/pace_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/data_sources/workout_metrics_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'calculators/avg_speed_calculator.dart';
import 'calculators/km_metric_calculator.dart';
import 'calculators/speed_calculator.dart';
import 'calculators/time_calculator.dart';
import 'managers/workout_metrics_manager.dart';
import 'state_holders/workout_metrics_state_holder.dart';

abstract interface class WorkoutMetricsParent {
  PersistentWorkoutStateHolder get persistentWorkoutStateHolder;

  WorkoutTrackDepsNode get workoutTrackDepsNode;
}

class WorkoutMetricsDepsNode extends DepsNode {
  final WorkoutMetricsParent _parent;
  final SupabaseClient _supabaseClient;

  late final speedCalculator = bind(
    () => SpeedCalculator(
      _parent.workoutTrackDepsNode,
    ),
  );

  late final kmMetricCalculator = bind(
    () => KmMetricCalculator(
      _parent.workoutTrackDepsNode,
    ),
  );

  late final avgSpeedCalculator = bind(
    () => const AvgSpeedCalculator(),
  );

  late final timeCalculator = bind(
    () => TimeCalculator(),
  );

  late final lastKmPaceCalculator = bind(
    () => LastKmPaceCalculator(
      _parent.workoutTrackDepsNode,
    ),
  );

  late final paceCalculator = bind(
    () => const PaceCalculator(),
  );

  late final workoutMetricsManager = bind(
    () => WorkoutMetricsManager(
      _parent.persistentWorkoutStateHolder,
      _parent.workoutTrackDepsNode,
      kmMetricCalculator(),
      workoutMetricsStateHolder(),
      avgSpeedCalculator(),
      speedCalculator(),
      timeCalculator(),
      paceCalculator(),
      lastKmPaceCalculator(),
    ),
  );

  late final workoutMetricsStateHolder = bind(
    () => WorkoutMetricsStateHolder(),
  );

  late final workoutMetricsDataSource = bind(
    () => WorkoutMetricsDataSource(_supabaseClient),
  );

  WorkoutMetricsDepsNode(this._parent, this._supabaseClient);

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
