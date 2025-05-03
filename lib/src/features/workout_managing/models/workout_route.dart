import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../tracking/models/extended_pos.dart';

part 'workout_route.freezed.dart';

part 'workout_route.g.dart';

@freezed
class WorkoutRoute with _$WorkoutRoute {
  const factory WorkoutRoute({
    required String uuid,
    @JsonKey(name: 'route_data') required List<ExtendedPos> routeData,
  }) = _WorkoutRoute;

  factory WorkoutRoute.fromJson(Map<String, dynamic> json) =>
      _$WorkoutRouteFromJson(json);
}
