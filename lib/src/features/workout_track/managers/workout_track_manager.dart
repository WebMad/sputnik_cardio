import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_track/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_track/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';

import '../../workout_core/workout_core.dart';

class WorkoutTrackManager {
  final WorkoutTrackRepository _workoutTrackRepository;
  final WorkoutTrackProvider Function(String uuid) _trackProvider;

  WorkoutTrackManager(
    this._workoutTrackRepository,
    this._trackProvider,
  );

  Future<void> retrive(Workout workout) async {
    final routes = workout.segments.map((e) => e.routeUuid);
    for (final route in routes) {
      final trackProvider = _trackProvider(route);

      final track = await _workoutTrackRepository.routeFromLocalStorage(route);

      trackProvider.pushAll(track);
    }
  }
}
