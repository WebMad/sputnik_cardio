import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

import '../../maps/providers/track_provider.dart';
import '../../workout_track/providers/workout_track_provider.dart';

class SpeedCalculator {
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  SpeedCalculator(this._workoutTrackDepsNode);

  /// TODO: почему-то между статусами скорость неправильно рассчитывается
  double calcSpeed(Workout workout) {
    final coords = workout.segments.fold(
      <ExtendedPos>[],
      (track, segment) => track
        ..addAll(
          _workoutTrackDepsNode
              .workoutTrackRepository()
              .getRoute(segment.routeUuid),
        ),
    ).toList();

    if (coords.length >= 2) {
      final last = coords.length - 1;

      final last1Coord = coords[last];
      final last2Coord = coords[last - 1];

      return _calcSpeed(last1Coord, last2Coord);
    }

    return 0;
  }

  double _calcSpeed(ExtendedPos pos1, ExtendedPos pos2) {
    final hours = pos1.fetchedAt.difference(pos2.fetchedAt).inSeconds / 60 / 60;

    final kms = pos1.distanceTo(pos2);

    if (hours == 0) {
      return 0;
    }

    return kms / hours;
  }
}
