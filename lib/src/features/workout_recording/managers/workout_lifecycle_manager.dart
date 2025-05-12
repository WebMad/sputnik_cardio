import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/pending_workouts_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';

import '../../workout_track/workout_track_deps_node.dart';
import '../data/repository/workout_repository.dart';
import '../state_holders/workout_state_holder.dart';

class WorkoutLifecycleManager implements Lifecycle {
  final PersistentWorkoutStateHolder _persistentWorkoutStateHolder;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutRepository _workoutRepository;
  final PendingWorkoutsManager _pendingWorkoutsManager;
  final WorkoutModificationManagerFactory _workoutModificationManagerFactory;

  WorkoutModificationManager? __workoutModificationManager;

  WorkoutModificationManager get _workoutModificationManager =>
      __workoutModificationManager ??
      (throw Exception('Workout is not started'));

  WorkoutProvider get _workoutProvider =>
      _workoutModificationManager.workoutProvider;

  StreamSubscription<Workout>? _workoutSub;

  WorkoutLifecycleManager(
    this._persistentWorkoutStateHolder,
    this._workoutCoordsRecordingManager,
    this._workoutTrackDepsNode,
    this._workoutRepository,
    this._pendingWorkoutsManager,
    this._workoutModificationManagerFactory,
  );

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {
    await _workoutSub?.cancel();
    _workoutSub = null;
  }

  Future<void> retrive(Workout workout) async {
    await _workoutTrackDepsNode.init();

    __workoutModificationManager = _workoutModificationManagerFactory.create();
    _workoutSub = _workoutProvider.workoutStream
        .startWith(_workoutProvider.workout)
        .listen((workout) => _persistentWorkoutStateHolder.update(workout));

    _workoutModificationManager.retrive(workout);

    if (_workoutProvider.workout.state != WorkoutState.paused) {
      final lastPos = await _getLastPos(_workoutProvider.workout);
      final startAt = lastPos != null ? lastPos.fetchedAt : DateTime.now();

      _workoutModificationManager.pause(startAt);

      final newRouteUuid = _workoutProvider.workout.lastSegment?.routeUuid;

      if (newRouteUuid != null) {
        await _pushPosFromPreviousSegment(
          _workoutProvider.workout,
          newRouteUuid,
        );
      }
    }

    _workoutTrackDepsNode
        .workoutTrackManager()
        .retrive(_workoutProvider.workout);

    await _updateAndStartRecord(_workoutProvider.workout);
  }

  Future<void> _pushPosFromPreviousSegment(
    Workout workout,
    String newRouteUuid,
  ) async {
    final lastPos = await _getLastPosFromPreviousSegment(workout);

    if (lastPos == null) {
      return;
    }

    await _workoutTrackDepsNode
        .workoutTrackRepository()
        .push(newRouteUuid, lastPos);
  }

  Future<ExtendedPos?> _getLastPosFromPreviousSegment(Workout workout) async {
    if (workout.segments.length < 2) {
      return null;
    }

    final segment = workout.segments[workout.segments.length - 2];

    final lastPos = _workoutTrackDepsNode
        .workoutTrackRepository()
        .getRoute(segment.routeUuid);

    final pos = lastPos.lastOrNull;
    return pos;
  }

  Future<ExtendedPos?> _getLastPos(Workout workout) async {
    final lastSegment = workout.lastSegment;

    if (lastSegment != null) {
      final lastPos = _workoutTrackDepsNode
          .workoutTrackRepository()
          .getRoute(lastSegment.routeUuid);

      final pos = lastPos.lastOrNull;
      return pos;
    }

    return null;
  }

  Future<void> _updateAndStartRecord(Workout workout) async {
    await _workoutCoordsRecordingManager.startRecord(workout);
    _workoutRepository.setActiveWorkout(workout);
  }

  Future<void> start() async {
    await _workoutTrackDepsNode.init();

    __workoutModificationManager = _workoutModificationManagerFactory.create();

    _workoutModificationManager.addSegment(
      segmentType: WorkoutSegmentType.run,
    );

    _workoutSub = _workoutProvider.workoutStream
        .startWith(_workoutProvider.workout)
        .listen((workout) => _persistentWorkoutStateHolder.update(workout));

    await _updateAndStartRecord(_workoutProvider.workout);
  }

  Future<void> pause() async {
    _workoutModificationManager.pause();

    final newRouteUuid = _workoutProvider.workout.lastSegment?.routeUuid;
    if (_workoutProvider.workout.segments.length >= 2 && newRouteUuid != null) {
      _pushPosFromPreviousSegment(_workoutProvider.workout, newRouteUuid);
    }

    _workoutCoordsRecordingManager.pauseRecord();
    _workoutRepository.setActiveWorkout(_workoutProvider.workout);
  }

  Future<void> resume() async {
    _workoutModificationManager.resume();

    final newRouteUuid = _workoutProvider.workout.lastSegment?.routeUuid;

    if (_workoutProvider.workout.segments.length >= 2 && newRouteUuid != null) {
      _pushPosFromPreviousSegment(_workoutProvider.workout, newRouteUuid);
    }

    _workoutCoordsRecordingManager.resumeRecord();
    _workoutRepository.setActiveWorkout(_workoutProvider.workout);
  }

  Future<void> stop() async {
    _workoutModificationManager.stop();

    await _workoutCoordsRecordingManager.stopRecord();

    _workoutRepository.removeActiveWorkout(_workoutProvider.workout);

    await _workoutRepository.createWorkout(_workoutProvider.workout);
    await _pendingWorkoutsManager.updateList();
  }

  Future<void> reset() async {
    _workoutSub?.cancel();
    _workoutSub = null;

    __workoutModificationManager = null;
    _persistentWorkoutStateHolder.updateState(null);
    await _workoutTrackDepsNode.dispose();
    _workoutTrackDepsNode.clear();
  }
}
