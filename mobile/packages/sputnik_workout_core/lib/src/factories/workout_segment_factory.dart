import 'package:uuid/uuid.dart';

import '../models/workout_segment.dart';

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
