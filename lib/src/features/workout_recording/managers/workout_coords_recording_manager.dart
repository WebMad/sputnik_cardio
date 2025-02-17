import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';

import '../../tracking/models/pos.dart';
import '../../workout_managing/models/workout.dart';

class WorkoutCoordsRecordingManager implements Lifecycle {
  final LocationManager _locationManager;
  final WorkoutTrackProvider _workoutTrackProvider;

  bool isPaused = false;

  StreamSubscription<Pos>? _locationSub;

  WorkoutCoordsRecordingManager(
    this._locationManager,
    this._workoutTrackProvider,
  );

  @override
  Future<void> init() async {}

  Future<void> startRecord(Workout workout) async {
    if (_locationSub != null) {
      return;
    }

    _locationSub = _locationManager.locationStream
        .throttleTime(const Duration(seconds: 1))
        .listen(
      (pos) {
        if (isPaused) {
          return;
        }

        _workoutTrackProvider.push(pos);
      },
    );
  }

  void pauseRecord() {
    isPaused = true;
  }

  void resumeRecord() {
    isPaused = false;
  }

  Future<void> stopRecord() async {
    _workoutTrackProvider.clear();
    await _locationSub?.cancel();
    _locationSub = null;
  }

  @override
  Future<void> dispose() async {
    await stopRecord();
  }
}
