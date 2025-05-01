import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:uuid/uuid.dart';

import '../../workout_track/workout_track_deps_node.dart';
import '../state_holders/workout_state_holder.dart';

class WorkoutLifecycleManager {
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutManager _workoutManager;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;
  final Uuid _uuid;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;

  WorkoutLifecycleManager(
    this._workoutStateHolder,
    this._workoutManager,
    this._workoutCoordsRecordingManager,
    this._uuid,
    this._workoutTrackDepsNode,
  );

  Future<void> start() async {
    await _workoutTrackDepsNode.init();

    final workout = _workoutManager.addSegment(
      workout: _workoutManager.create().copyWith(
            state: WorkoutState.inProcess,
          ),
      segment: WorkoutSegment(
        type: WorkoutSegmentType.run,
        startAt: DateTime.now(),
        routeUuid: _uuid.v4(),
      ),
    );

    await _workoutCoordsRecordingManager.startRecord(workout);

    _workoutStateHolder.updateState(workout);
  }

  Future<void> pause() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.paused,
    );

    if (workout == null) {
      return;
    }

    final routeUuid = workout.lastSegment?.routeUuid;

    final newRouteUuid = _uuid.v4();

    WorkoutSegment newSegment = WorkoutSegment(
      type: WorkoutSegmentType.pause,
      startAt: DateTime.now(),
      routeUuid: newRouteUuid,
    );

    if (routeUuid != null) {
      final lastPointFromPreviousTrack =
          _workoutTrackDepsNode.trackProvider(routeUuid).track.lastOrNull;

      if (lastPointFromPreviousTrack != null) {
        _workoutTrackDepsNode
            .trackProvider(newRouteUuid)
            .push(lastPointFromPreviousTrack);
      }
    }

    _workoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: workout,
        segment: newSegment,
      ),
    );
    _workoutCoordsRecordingManager.pauseRecord();
  }

  Future<void> resume() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.inProcess,
    );

    if (workout == null) {
      return;
    }

    final routeUuid = workout.lastSegment?.routeUuid;

    final newRouteUuid = _uuid.v4();

    WorkoutSegment workoutSegment = WorkoutSegment(
      type: WorkoutSegmentType.run,
      startAt: DateTime.now(),
      routeUuid: newRouteUuid,
    );

    if (routeUuid != null) {
      final lastPointFromPreviousTrack =
          _workoutTrackDepsNode.trackProvider(routeUuid).track.lastOrNull;

      if (lastPointFromPreviousTrack != null) {
        _workoutTrackDepsNode
            .trackProvider(newRouteUuid)
            .push(lastPointFromPreviousTrack);
      }
    }

    _workoutCoordsRecordingManager.resumeRecord();

    _workoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: workout,
        segment: workoutSegment,
      ),
    );
  }

  Future<void> stop() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.stopped,
    );

    if (workout == null) {
      return;
    }

    _workoutStateHolder.updateState(
      _workoutManager.finishSegment(workout: workout),
    );

    await _workoutCoordsRecordingManager.stopRecord();
  }

  Future<void> reset() async {
    _workoutStateHolder.updateState(null);
    await _workoutTrackDepsNode.dispose();
    _workoutTrackDepsNode.clear();
  }
}
