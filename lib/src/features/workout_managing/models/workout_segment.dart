import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_segment.freezed.dart';

part 'workout_segment.g.dart';

@freezed
class WorkoutSegment with _$WorkoutSegment {
  const factory WorkoutSegment({
    @JsonKey(name: 'uuid') required String uuid,
    @JsonKey(name: 'type') required WorkoutSegmentType type,
    @JsonKey(name: 'start_at') required DateTime startAt,
    @JsonKey(name: 'route_uuid') required String routeUuid,
    @JsonKey(name: 'end_at') DateTime? endAt,
  }) = _WorkoutSegment;

  factory WorkoutSegment.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSegmentFromJson(json);
}

enum WorkoutSegmentType {
  run,
  cycling,
  pause,
}
