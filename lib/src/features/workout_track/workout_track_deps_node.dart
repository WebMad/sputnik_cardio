import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/workout_track/providers/workout_track_provider.dart';

import 'data_sources/workout_track_data_source.dart';

class WorkoutTrackDepsNode extends DepsNode {
  final SharedPrefsManager _sharedPrefsManager;

  late final trackProvider = bindSingletonFactory(
    (String trackUuid) => WorkoutTrackProvider(),
  );

  late final workoutTrackDataSource = bind(
    () => WorkoutTrackDataSource(
      _sharedPrefsManager.sharedPreferences,
    ),
  );

  WorkoutTrackDepsNode(this._sharedPrefsManager);
}
