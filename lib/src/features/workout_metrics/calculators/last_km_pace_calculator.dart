import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

class LastKmPaceCalculator {
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  LastKmPaceCalculator(this._workoutTrackDepsNode);

  /// Calculates average pace for the last kilometer in minutes per kilometer
  Duration calcPace(Workout workout) {
    final coords = workout.activeSegments
        .fold(
          <ExtendedPos>[],
          (track, segment) => track
            ..addAll(
              _workoutTrackDepsNode
                  .workoutTrackRepository()
                  .getRoute(segment.routeUuid),
            ),
        )
        .toSet()
        .toList();

    if (coords.length < 2) {
      return Duration.zero;
    }

    // Sort by time to ensure correct order
    coords.sort((a, b) => a.fetchedAt.compareTo(b.fetchedAt));

    // Find points that make up the last kilometer
    final lastKmPoints = <ExtendedPos>[];
    double distance = 0;

    for (int i = coords.length - 1; i > 0; i--) {
      final currentPoint = coords[i];
      final previousPoint = coords[i - 1];

      final segmentDistance = currentPoint.distanceTo(previousPoint);

      lastKmPoints.insert(0, currentPoint);

      distance += segmentDistance;

      if (distance >= 1.0) {
        // 1 kilometer
        lastKmPoints.insert(0, previousPoint);
        break;
      }
    }

    if (lastKmPoints.length < 2) {
      return Duration.zero;
    }

    // Calculate time taken for the last kilometer with millisecond precision
    final lastKmDuration =
        lastKmPoints.last.fetchedAt.difference(lastKmPoints.first.fetchedAt);

    if (distance < 1) {
      return Duration(milliseconds: lastKmDuration.inMilliseconds ~/ distance);
    }

    return lastKmDuration;
  }
}
