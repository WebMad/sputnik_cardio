import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';

import '../state_holders/workout_state_holder.dart';

class WorkoutLifecycleManager {
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutManager _workoutManager;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;

  WorkoutLifecycleManager(
    this._workoutStateHolder,
    this._workoutManager,
    this._workoutCoordsRecordingManager,
  );

  Future<void> start() async {
    final workout = _workoutManager.addSegment(
      workout: _workoutManager.create().copyWith(
            state: WorkoutState.inProcess,
          ),
      segment: WorkoutSegment(
        type: WorkoutSegmentType.run,
        startAt: DateTime.now(),
      ),
    );
    _workoutStateHolder.updateState(workout);

    _workoutCoordsRecordingManager.startRecord(workout);
  }

  Future<void> pause() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.paused,
    );

    if (workout == null) {
      return;
    }

    _workoutCoordsRecordingManager.pauseRecord();
    _workoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: workout,
        segment: WorkoutSegment(
          type: WorkoutSegmentType.pause,
          startAt: DateTime.now(),
        ),
      ),
    );
  }

  Future<void> resume() async {
    final workout = _workoutStateHolder.state?.copyWith(
      state: WorkoutState.inProcess,
    );

    if (workout == null) {
      return;
    }

    _workoutCoordsRecordingManager.resumeRecord();
    _workoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: workout,
        segment: WorkoutSegment(
          type: WorkoutSegmentType.run,
          startAt: DateTime.now(),
        ),
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
      workout.copyWith(
        segments: [
          if (workout.segments.isNotEmpty) ...[
            ...workout.segments.sublist(0, workout.segments.length - 1),
            workout.segments.last.copyWith(endAt: DateTime.now()),
          ] else
            ...workout.segments
        ],
      ),
    );
    await _workoutCoordsRecordingManager.stopRecord();
  }

  Future<void> reset() async {
    _workoutStateHolder.updateState(null);
  }
}
