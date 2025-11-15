import '../models/detailed_workout.dart';

abstract class GpxExporter {
  String export(DetailedWorkout workout);
  String generateFileName(DetailedWorkout workout);
}
