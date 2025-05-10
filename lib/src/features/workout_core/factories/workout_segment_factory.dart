import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:uuid/uuid.dart';

import 'workout_route_factory.dart';

class WorkoutSegmentFactory {
  final Uuid _uuid;

  WorkoutSegmentFactory(this._uuid);

  WorkoutSegment create(
    WorkoutSegmentType workoutSegmentType,
    String routeUuid, [
    DateTime? startAt,
  ]) {
    return WorkoutSegment(
      uuid: _uuid.v4(),
      type: workoutSegmentType,
      startAt: startAt ?? DateTime.now(),
      routeUuid: routeUuid,
    );
  }
}
