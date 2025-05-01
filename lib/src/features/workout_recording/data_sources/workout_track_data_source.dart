import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

class WorkoutTrackDataSource {
  static const _trackListKey = 'workout_recording_tracks';

  final SharedPreferences _sharedPreferences;

  WorkoutTrackDataSource(this._sharedPreferences);

  String _getTrackKey(String trackUuid) => 'workout_recording_track_$trackUuid';

  List<String> trackList() {
    final trackList = _sharedPreferences.getString(_trackListKey);

    if (trackList == null) {
      return [];
    }

    return (jsonDecode(trackList) as List<dynamic>).cast<String>();
  }

  Future<List<ExtendedPos>> getTrack(String trackUuid) async {
    final track = _sharedPreferences.getString(_getTrackKey(trackUuid));

    if (track == null) {
      return [];
    }

    return (jsonDecode(track) as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map((e) => ExtendedPos.fromJson(e))
        .toList();
  }

  Future<void> setTrack(String trackUuid, List<ExtendedPos> poses) async {
    final json = jsonEncode(poses.map((e) => e.toJson()).toList());

    _sharedPreferences.setString(_getTrackKey(trackUuid), json);

    await _sharedPreferences.setString(_getTrackKey(trackUuid), json);
  }

  Future<void> pushPos(String trackUuid, ExtendedPos pos) async {
    // TODO: предусмотреть механизм кеширования
    final track = await getTrack(trackUuid);

    final newTrack = [...track]..add(pos);

    setTrack(trackUuid, newTrack);
  }
}
