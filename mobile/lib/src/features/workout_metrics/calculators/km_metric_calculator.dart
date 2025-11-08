import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:sputnik_location/sputnik_location.dart';

class KmMetricCalculator {
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  KmMetricCalculator(this._workoutTrackDepsNode);

  double calcDistanceForWorkout(Workout workout) {
    final segments = workout.activeSegments;

    double distance = 0;

    for (final segment in segments) {
      distance += _calcDistanceForRoute(segment.routeUuid);
    }

    return distance;
  }

  double _calcDistanceForRoute(String routeUuid) {
    final track =
        _workoutTrackDepsNode.workoutTrackRepository().getRoute(routeUuid);

    double distance = 0;

    for (int i = 1; i < track.length; i++) {
      distance += track[i - 1].distanceTo(track[i]);
    }

    return distance;
  }
}
