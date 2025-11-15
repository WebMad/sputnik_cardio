import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import '../workout_recording/services/gpx_export_service.dart';
import '../workout_recording/workout_deps_node.dart';

class WorkoutExportDepsNode extends DepsNode {
  final WorkoutDepsNode parent;

  late final gpxExportService = bind(
    () => GpxExportService(),
  );

  WorkoutExportDepsNode(this.parent);
}
