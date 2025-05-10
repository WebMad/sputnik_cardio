import '../models/workout.dart';

abstract interface class WorkoutProvider {
  Workout? get workout;

  Stream<Workout?> get workoutStream;

  void update(Workout? workout);
}
