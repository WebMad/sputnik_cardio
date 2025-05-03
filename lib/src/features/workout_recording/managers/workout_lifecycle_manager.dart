import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:uuid/uuid.dart';

import '../../workout_track/workout_track_deps_node.dart';
import '../data/data_sources/workout_data_source.dart';
import '../data/repository/workout_repository.dart';
import '../state_holders/workout_state_holder.dart';

class WorkoutLifecycleManager {
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutManager _workoutManager;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;
  final Uuid _uuid;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final WorkoutDataSource _workoutDataSource;
  final WorkoutTrackDataSource _workoutTrackDataSource;
  final WorkoutRepository _workoutRepository;

  WorkoutLifecycleManager(
    this._workoutStateHolder,
    this._workoutManager,
    this._workoutCoordsRecordingManager,
    this._uuid,
    this._workoutTrackDepsNode,
    this._workoutDataSource,
    this._workoutTrackDataSource,
    this._workoutRepository,
  );

  Future<void> retrive(Workout workout) async {
    await _workoutTrackDepsNode.init();

    Workout newWorkout = workout;

    if (workout.state != WorkoutState.paused) {
      DateTime startAt = DateTime.now();

      final pauseSegment = WorkoutSegment(
        type: WorkoutSegmentType.pause,
        startAt: startAt,
        routeUuid: _uuid.v4(),
        uuid: _uuid.v4(),
      );

      final lastSegment = newWorkout.lastSegment;

      if (lastSegment != null) {
        final lastPos =
            await _workoutTrackDataSource.getTrack(lastSegment.routeUuid);

        final pos = lastPos.lastOrNull;

        if (pos != null) {
          await _workoutTrackDataSource.pushPos(
            pauseSegment.routeUuid,
            pos,
          );

          startAt = pos.fetchedAt;
        }
      }

      newWorkout = _workoutManager.addSegment(
        workout: workout.copyWith(state: WorkoutState.paused),
        segment: pauseSegment.copyWith(
          startAt: startAt,
        ),
      );
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

    final workout = _workoutManager.addSegment(
      workout: _workoutManager.create().copyWith(
            state: WorkoutState.inProcess,
          ),
      segment: WorkoutSegment(
        type: WorkoutSegmentType.run,
        startAt: DateTime.now(),
        routeUuid: _uuid.v4(),
        uuid: _uuid.v4(),
      ),
    );

    await _workoutCoordsRecordingManager.startRecord(workout);

    _workoutStateHolder.updateState(workout);

    _workoutDataSource.setWorkout(workout);
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
      uuid: _uuid.v4(),
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

    final newWorkout = _workoutManager.addSegment(
      workout: workout,
      segment: newSegment,
    );
    _workoutCoordsRecordingManager.pauseRecord();

    _workoutStateHolder.updateState(newWorkout);
    _workoutDataSource.setWorkout(newWorkout);
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
      uuid: _uuid.v4(),
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

    final newWorkout = _workoutManager.addSegment(
      workout: workout,
      segment: workoutSegment,
    );

    _workoutStateHolder.updateState(newWorkout);

    _workoutDataSource.setWorkout(newWorkout);
  }

  Future<void> stop() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.stopped,
    );

    if (workout == null) {
      return;
    }

    final newWorkout = _workoutManager.finishSegment(workout: workout).copyWith(
          stopAt: DateTime.now(),
        );

    _workoutStateHolder.updateState(newWorkout);

    await _workoutCoordsRecordingManager.stopRecord();

    _workoutDataSource.clearWorkout(workout.uuid);

    _workoutRepository.createWorkout(newWorkout);
  }

  Future<void> reset() async {
    _workoutStateHolder.updateState(null);
    await _workoutTrackDepsNode.dispose();
    _workoutTrackDepsNode.clear();
  }
}
