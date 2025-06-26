import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';

part 'workouts_list_data.freezed.dart';

@freezed
class WorkoutsListData with _$WorkoutsListData {
  const factory WorkoutsListData.loading() = LoadingWorkoutsListData;

  const factory WorkoutsListData.data({
    required int offset,
    required List<DetailedWorkout> workouts,
  }) = DataWorkoutsListData;
}

extension WorkoutsListDataEx on WorkoutsListData {
  DataWorkoutsListData? get dataOrNull => mapOrNull(data: (state) => state);
}
