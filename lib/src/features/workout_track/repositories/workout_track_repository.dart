import 'package:sputnik_cardio/src/features/workout_track/data_sources/workout_track_data_source.dart';

import '../../tracking/models/extended_pos.dart';
import '../providers/workout_track_provider.dart';

class WorkoutTrackRepository {
  final WorkoutTrackProvider Function(String uuid) _trackProviderFactory;
  final WorkoutTrackDataSource _workoutTrackDataSource;

  WorkoutTrackRepository(
    this._trackProviderFactory,
    this._workoutTrackDataSource,
  );

  List<ExtendedPos> getRoute(String routeUuid) =>
      _trackProviderFactory(routeUuid).track;

  Future<List<ExtendedPos>> routeFromLocalStorage(String routeUuid) =>
      _workoutTrackDataSource.getTrack(routeUuid);

  void pushAll(String routeUuid, List<ExtendedPos> coords) {
    _trackProviderFactory(routeUuid).pushAll(coords);
    _workoutTrackDataSource.setTrack(routeUuid, coords);
  }

  Future<void> push(String routeUuid, ExtendedPos pos) async {
    _trackProviderFactory(routeUuid).push(pos);
    await _workoutTrackDataSource.pushPos(routeUuid, pos);
  }
}
