import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/maps/providers/track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_track/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_track/repositories/workout_track_repository.dart';

import 'data_sources/workout_track_data_source.dart';
import 'managers/workout_track_manager.dart';

class WorkoutTrackDepsNode extends DepsNode {
  final SharedPrefsManager _sharedPrefsManager;

  late final _workoutTrackProvider = bindSingletonFactory(
    (String trackUuid) => WorkoutTrackProvider(),
  );

  late final trackProvider = bindSingletonFactory<TrackProvider, String>(
    (String trackUuid) => _workoutTrackProvider(trackUuid),
  );

  late final _workoutTrackDataSource = bind(
    () => WorkoutTrackDataSource(
      _sharedPrefsManager.sharedPreferences,
    ),
  );

  late final workoutTrackRepository = bind(
    () => WorkoutTrackRepository(
      (uuid) => _workoutTrackProvider(uuid),
      _workoutTrackDataSource(),
    ),
  );

  late final workoutTrackManager = bind(
    () => WorkoutTrackManager(
      (uuid) => _workoutTrackProvider(uuid),
      _workoutTrackDataSource(),
    ),
  );

  WorkoutTrackDepsNode(this._sharedPrefsManager);
}
