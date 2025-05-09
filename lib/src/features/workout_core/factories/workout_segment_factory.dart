import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:uuid/uuid.dart';

import 'workout_route_factory.dart';

class WorkoutSegmentFactory {
  final WorkoutRouteFactory _workoutRouteFactory;
  final Uuid _uuid;

  WorkoutSegmentFactory(
    this._workoutRouteFactory,
    this._uuid,
  );

  WorkoutSegment create(
    WorkoutSegmentType workoutSegmentType,
    String routeUuid,
  ) {
    return WorkoutSegment(
      uuid: _uuid.v4(),
      type: workoutSegmentType,
      startAt: DateTime.now(),
      routeUuid: routeUuid,
    );
  }
}
