import 'package:freezed_annotation/freezed_annotation.dart';

import 'sputnik_route.dart';

part 'workout_segment.freezed.dart';

@freezed
class WorkoutSegment with _$WorkoutSegment {
  const factory WorkoutSegment({
    required WorkoutSegmentType type,
    required DateTime startAt,
    required String routeUuid,
    DateTime? endAt,
  }) = _WorkoutSegment;
}

enum WorkoutSegmentType {
  run,
  cycling,
  pause,
}
