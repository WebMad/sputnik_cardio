import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_location/sputnik_location.dart';

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
