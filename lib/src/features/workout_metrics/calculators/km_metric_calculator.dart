import '../../tracking/models/extended_pos.dart';
import '../../workout_core/models/workout.dart';
import '../../workout_core/models/workout_segment.dart';
import '../../workout_recording/providers/workout_track_provider.dart';

class KmMetricCalculator {
  final WorkoutTrackProvider Function(String uuid) workoutTrackProviderFactory;

  KmMetricCalculator(this.workoutTrackProviderFactory);

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
    final trackProvider = workoutTrackProviderFactory(routeUuid);

    final track = trackProvider.track;

    double distance = 0;

    for (int i = 1; i < track.length; i++) {
      distance += track[i - 1].distanceTo(track[i]);
    }

    return distance;
  }
}
