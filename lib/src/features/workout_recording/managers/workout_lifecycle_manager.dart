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
  final Uuid _uuid;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutDataSource _workoutDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;
  final WorkoutRepository _workoutRepository;
  final PendingWorkoutsManager _pendingWorkoutsManager;

  WorkoutLifecycleManager(
    this._workoutStateHolder,
    this._workoutModificationManager,
    this._workoutCoordsRecordingManager,
    this._uuid,
    this._workoutTrackDepsNode,
    this._workoutDataSource,
    this._workoutTrackDataSource,
    this._workoutRepository,
    this._pendingWorkoutsManager,
  );

  Future<void> retrive(Workout workout) async {
    await _workoutTrackDepsNode.init();

    Workout newWorkout = workout;

    if (workout.state != WorkoutState.paused) {
      DateTime startAt = DateTime.now();

      final routeUuid = _uuid.v4();

      final lastSegment = newWorkout.lastSegment;

      if (lastSegment != null) {
        final lastPos =
            await _workoutTrackDataSource.getTrack(lastSegment.routeUuid);

        final pos = lastPos.lastOrNull;

        if (pos != null) {
          await _workoutTrackDataSource.pushPos(
            routeUuid,
            pos,
          );

          startAt = pos.fetchedAt;
        }
      }

      newWorkout = _workoutModificationManager.pause(workout, startAt);
    }

    final routes = newWorkout.segments.map((e) => e.routeUuid);

    for (final route in routes) {
      final trackProvider = _workoutTrackDepsNode.trackProvider(route);

      final track = await _workoutTrackDataSource.getTrack(route);

      trackProvider.pushAll(track);
    }

    _workoutDataSource.setWorkout(newWorkout);
    _workoutStateHolder.updateState(newWorkout);
    await _workoutCoordsRecordingManager.startRecord(newWorkout);
  }

  Future<void> start() async {
    await _workoutTrackDepsNode.init();

    final workout = _workoutModificationManager.addSegment(
      workout: _workoutModificationManager.start(),
      segmentType: WorkoutSegmentType.run,
    );

    await _workoutCoordsRecordingManager.startRecord(workout);

    _workoutStateHolder.updateState(workout);
    _workoutDataSource.setWorkout(workout);
  }

  Future<void> pause() async {
    final workout = _workoutStateHolder.state;

    if (workout == null) {
      return;
    }

    final routeUuid = workout.lastSegment?.routeUuid;

    final newWorkout = _workoutModificationManager.pause(workout);
    final newRouteUuid = newWorkout.lastSegment?.routeUuid;

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

    _workoutStateHolder.updateState(newWorkout);
    _workoutDataSource.setWorkout(newWorkout);
  }

  Future<void> resume() async {
    final workout = _workoutStateHolder.state;

    if (workout == null) {
      return;
    }

    final routeUuid = workout.lastSegment?.routeUuid;

    final newWorkout = _workoutModificationManager.resume(workout);
    final newRouteUuid = newWorkout.lastSegment?.routeUuid;

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

    _workoutStateHolder.updateState(newWorkout);

    _workoutDataSource.setWorkout(newWorkout);
  }

  Future<void> stop() async {
    final workout = _workoutStateHolder.state;

    if (workout == null) {
      return;
    }

    final newWorkout = _workoutModificationManager.stop(workout);

    _workoutStateHolder.updateState(newWorkout);

    await _workoutCoordsRecordingManager.stopRecord();

    _workoutDataSource.clearWorkout(workout.uuid);

    await _workoutRepository.createWorkout(newWorkout);
    await _pendingWorkoutsManager.updateList();
  }

  Future<void> reset() async {
    _workoutStateHolder.updateState(null);
    await _workoutTrackDepsNode.dispose();
    _workoutTrackDepsNode.clear();
  }
}
