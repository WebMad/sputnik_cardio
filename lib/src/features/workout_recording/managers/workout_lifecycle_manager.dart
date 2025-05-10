import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_core/managers/workout_modification_manager.dart';
import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/pending_workouts_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:uuid/uuid.dart';

import '../../workout_track/workout_track_deps_node.dart';
import '../data/data_sources/workout_data_source.dart';
import '../data/repository/workout_repository.dart';
import '../state_holders/pending_workouts_state_holder.dart';
import '../state_holders/workout_state_holder.dart';

class WorkoutLifecycleManager {
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutModificationManager _workoutModificationManager;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutDataSource _workoutDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;
  final WorkoutRepository _workoutRepository;
  final PendingWorkoutsManager _pendingWorkoutsManager;

  WorkoutLifecycleManager(
    this._workoutStateHolder,
    this._workoutModificationManager,
    this._workoutCoordsRecordingManager,
    this._workoutTrackDepsNode,
    this._workoutDataSource,
    this._workoutTrackDataSource,
    this._workoutRepository,
    this._pendingWorkoutsManager,
  );

  Future<void> retrive(Workout workout) async {
    await _workoutTrackDepsNode.init();
    _workoutStateHolder.updateState(workout);

    if (workout.state != WorkoutState.paused) {
      final lastPos = await _getLastPos(_workoutStateHolder.workout!);
      final startAt = lastPos != null ? lastPos.fetchedAt : DateTime.now();

      _workoutModificationManager.pause(startAt);

      final newRouteUuid = _workoutStateHolder.workout!.lastSegment?.routeUuid;

      if (newRouteUuid != null) {
        await _pushPosFromPreviousSegment(
          _workoutStateHolder.workout!,
          newRouteUuid,
        );
      }
    }

    final routes =
        _workoutStateHolder.workout!.segments.map((e) => e.routeUuid);

    for (final route in routes) {
      final trackProvider = _workoutTrackDepsNode.trackProvider(route);

      final track = await _workoutTrackDataSource.getTrack(route);

      trackProvider.pushAll(track);
    }

    await _updateAndStartRecord(_workoutStateHolder.workout!);
  }

  Future<void> _pushPosFromPreviousSegment(
    Workout workout,
    String newRouteUuid,
  ) async {
    final lastPos = await _getLastPos(workout);

    if (lastPos == null) {
      return;
    }

    await _workoutTrackDataSource.pushPos(
      newRouteUuid,
      lastPos,
    );
  }

  Future<ExtendedPos?> _getLastPos(Workout workout) async {
    final lastSegment = workout.lastSegment;

    if (lastSegment != null) {
      final lastPos =
          await _workoutTrackDataSource.getTrack(lastSegment.routeUuid);

      final pos = lastPos.lastOrNull;
      return pos;
    }

    return null;
  }

  Future<void> _updateAndStartRecord(Workout workout) async {
    await _workoutCoordsRecordingManager.startRecord(workout);

    _workoutDataSource.setWorkout(workout);
  }

  Future<void> start() async {
    await _workoutTrackDepsNode.init();

    _workoutModificationManager.start();
    _workoutModificationManager.addSegment(
      segmentType: WorkoutSegmentType.run,
    );

    await _updateAndStartRecord(_workoutStateHolder.workout!);
  }

  Future<void> pause() async {
    final workout = _workoutStateHolder.state;

    if (workout == null) {
      return;
    }

    final routeUuid = workout.lastSegment?.routeUuid;
    _workoutModificationManager.pause();

    final newRouteUuid = _workoutStateHolder.workout?.lastSegment?.routeUuid;

    if (routeUuid != null && newRouteUuid != null) {
      final lastPointFromPreviousTrack =
          _workoutTrackDepsNode.trackProvider(routeUuid).track.lastOrNull;

      if (lastPointFromPreviousTrack != null) {
        _workoutTrackDepsNode
            .trackProvider(newRouteUuid)
            .push(lastPointFromPreviousTrack);
      }
    }

    _workoutCoordsRecordingManager.pauseRecord();

    _workoutDataSource.setWorkout(_workoutStateHolder.state!);
  }

  Future<void> resume() async {
    final routeUuid = _workoutStateHolder.state!.lastSegment?.routeUuid;

    _workoutModificationManager.resume();
    final newRouteUuid = _workoutStateHolder.workout!.lastSegment?.routeUuid;

    if (routeUuid != null && newRouteUuid != null) {
      final lastPointFromPreviousTrack =
          _workoutTrackDepsNode.trackProvider(routeUuid).track.lastOrNull;

      if (lastPointFromPreviousTrack != null) {
        _workoutTrackDepsNode
            .trackProvider(newRouteUuid)
            .push(lastPointFromPreviousTrack);
      }
    }

    _workoutCoordsRecordingManager.resumeRecord();
    _workoutDataSource.setWorkout(_workoutStateHolder.state!);
  }

  Future<void> stop() async {
    _workoutModificationManager.stop();

    await _workoutCoordsRecordingManager.stopRecord();

    _workoutDataSource.clearWorkout(_workoutStateHolder.workout!.uuid);

    await _workoutRepository.createWorkout(_workoutStateHolder.workout!);
    await _pendingWorkoutsManager.updateList();
  }

  Future<void> reset() async {
    _workoutStateHolder.updateState(null);
    await _workoutTrackDepsNode.dispose();
    _workoutTrackDepsNode.clear();
  }
}
