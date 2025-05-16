import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

class LastKmPaceCalculator {
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  LastKmPaceCalculator(this._workoutTrackDepsNode);

  /// Calculates average pace for the last kilometer in minutes per kilometer
  Duration calcPace(Workout workout) {
    final segments = workout.segments;

    Duration duration = Duration.zero;
    double distance = 0;

    for (final segment in segments) {
      if (!segment.isActive) {
        continue;
      }

      final coords = _workoutTrackDepsNode
          .workoutTrackRepository()
          .getRoute(segment.routeUuid);

      for (int i = 1; i < coords.length; i++) {
        final previousCoord = coords[i - 1];
        final coord = coords[i];

        final currentDistance = previousCoord.distanceTo(coord);
        final currentDuration =
            coord.fetchedAt.difference(previousCoord.fetchedAt);

        distance += currentDistance;
        duration += currentDuration;

        if (distance >= 1) {
          final moreThanKm = distance - 1;

          if (moreThanKm > 0) {
            final rate = 1 - (moreThanKm / currentDistance);
            final moreThanDuration = Duration(
              microseconds: (currentDuration.inMicroseconds * rate).round(),
            );

            duration -= moreThanDuration;
            distance -= currentDistance * rate;
          }
          break;
        }
      }
    }

    if (distance == 0) {
      return Duration.zero;
    }

    return Duration(microseconds: (duration.inMicroseconds / distance).round());
  }
}
