import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';

class WorkoutTrackDepsNode extends DepsNode {
  late final trackProvider = bindSingletonFactory(
    (String trackUuid) => WorkoutTrackProvider(),
  );
}
