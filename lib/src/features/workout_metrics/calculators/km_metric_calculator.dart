import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import '../../maps/providers/track_provider.dart';
import '../../tracking/models/extended_pos.dart';
import '../../workout_track/providers/workout_track_provider.dart';

class KmMetricCalculator {
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  KmMetricCalculator(this._workoutTrackDepsNode);

  double calcDistanceForWorkout(Workout workout) {
    final segments = workout.segments;

    double distance = 0;

    for (final segment in segments) {
      if (WorkoutSegment.activeTypes.contains(segment.type)) {
        distance += _calcDistanceForRoute(segment.routeUuid);
      }
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
