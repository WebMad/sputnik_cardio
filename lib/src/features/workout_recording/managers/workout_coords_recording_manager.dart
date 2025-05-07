import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

import '../../tracking/models/pos.dart';
import '../../workout_core/models/workout.dart';

class WorkoutCoordsRecordingManager implements Lifecycle {
  final LocationManager _locationManager;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutTrackDataSource _workoutTrackDataSource;

  bool isPaused = false;

  StreamSubscription<Pos>? _locationSub;

  WorkoutCoordsRecordingManager(
    this._locationManager,
    this._workoutTrackDepsNode,
    this._workoutStateHolder,
    this._workoutTrackDataSource,
  );

  @override
  Future<void> init() async {}

  Future<void> startRecord(Workout workout) async {
    if (_locationSub != null) {
      return;
    }

    /// TODO: способ не телепортироваться в центр Москвы
    /// не очень надежный, но задачу решает
    await _locationManager.location;

    _locationSub =
        _locationManager.locationStream.listen((pos) => _recordCoords(pos));

    _recordCoords(_locationManager.lastLocation);
  }

  void _recordCoords(ExtendedPos pos) {
    final workout = _workoutStateHolder.state;

    if (isPaused || workout == null || workout.segments.isEmpty) {
      return;
    }

    final routeUuid = workout.segments.last.routeUuid;

    final workoutTrackProvider = _workoutTrackDepsNode.trackProvider(routeUuid);

    workoutTrackProvider.push(pos);

    /// TODO: тут может случиться гонка, между двумя сохранениями, поэтому
    /// в будущем надо будет предусмотреть очередь/блокировка (lock)
    _workoutTrackDataSource.pushPos(routeUuid, pos);
  }

  void pauseRecord() {
    _recordCoords(_locationManager.lastLocation);
    // isPaused = true;
  }

  void resumeRecord() {
    // isPaused = false;
    _recordCoords(_locationManager.lastLocation);
  }

  Future<void> stopRecord() async {
    await _locationSub?.cancel();
    _locationSub = null;
  }

  @override
  Future<void> dispose() async {
    await stopRecord();
  }
}
