import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';

import '../../workout_recording/providers/workout_track_provider.dart';

class SpeedCalculator {
  final WorkoutTrackProvider Function(String uuid) workoutTrackProviderFactory;

  SpeedCalculator(this.workoutTrackProviderFactory);

  /// TODO: почему-то между статусами скорость неправильно рассчитывается
  double calcSpeed(Workout workout) {
    final coords = workout.segments.fold(
      <ExtendedPos>[],
      (track, segment) {
        final route = workoutTrackProviderFactory(segment.routeUuid).track;

        if (route.isNotEmpty) {
          return track..addAll(route.sublist(1));
        }

        return track;
      },
    ).toList();

    if (coords.length >= 3) {
      final last = coords.length - 1;

      final last1Coord = coords[last];
      final last2Coord = coords[last - 1];
      final last3Coord = coords[last - 2];

      final sumOfSpeed = _calcSpeed(last1Coord, last2Coord) +
          _calcSpeed(last2Coord, last3Coord);

      return sumOfSpeed / 2;
    }

    if (coords.length == 2) {
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
