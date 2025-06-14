import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../handlers/foreground_task_handler.dart';

@pragma('vm:entry-point')
void startCallbackForForegroundService() {
  FlutterForegroundTask.setTaskHandler(ForegroundTaskHandler());
}
