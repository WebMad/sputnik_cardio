import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/maps/providers/track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_screen_state_holder.dart';

class WorkoutScreenManager implements Lifecycle {
  final WorkoutScreenStateHolder _workoutScreenStateHolder;
  final WorkoutTrackProvider Function(String routeUuid)
      _workoutTrackProviderFactory;

  WorkoutScreenManager(
    this._workoutScreenStateHolder,
    this._workoutTrackProviderFactory,
  );

  @override
  Future<void> init() async {
    final routes = _workoutScreenStateHolder.state.routes;

    final routesUuids = routes.keys.toList();

    for (final routeUuid in routesUuids) {
      _workoutTrackProviderFactory(routeUuid).pushAll(routes[routeUuid]!);
    }
  }

  @override
  Future<void> dispose() async {}
}
