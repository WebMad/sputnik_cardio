import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_input.dart';

class ForegroundExecuteManager {
  void execute(ForegroundTaskInput input) {
    FlutterForegroundTask.sendDataToTask(input.toJson());
  }
}
