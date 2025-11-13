import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_input.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_output.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/geolocator_location_manager.dart';

@pragma('vm:entry-point')
class ForegroundTaskHandler extends TaskHandler {
  // Called when the task is started.
  @override
  @pragma('vm:entry-point')
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    print('onStart(starter: ${starter.name})');
  }

  // Called based on the eventAction set in ForegroundTaskOptions.
  @override
  @pragma('vm:entry-point')
  void onRepeatEvent(DateTime timestamp) {
    Geolocator.getPositionStream(
      locationSettings: Platform.isAndroid
          ? AndroidSettings(
              forceLocationManager: true,
            )
          : null,
    ).listen(
      (event) {
        final pos =
            ForegroundTaskOutput.locationStream(pos: event.pos).toJson();
        FlutterForegroundTask.sendDataToMain(pos);
      },
    );
  }

  // Called when the task is destroyed.
  @override
  @pragma('vm:entry-point')
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    print('onDestroy(isTimeout: $isTimeout)');
  }

  // Called when data is sent using `FlutterForegroundTask.sendDataToTask`.
  @override
  @pragma('vm:entry-point')
  void onReceiveData(Object data) {
    if (data is! Map<String, dynamic>) {
      return;
    }

    final input = ForegroundTaskInput.fromJson(data);

    input.mapOrNull(
      location: (value) => _getCurrentLocation(),
    );
  }

  @pragma('vm:entry-point')
  Future<void> _getCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition();

    FlutterForegroundTask.sendDataToMain(
      ForegroundTaskOutput.location(
        pos: location.pos,
      ).toJson(),
    );
  }

  // Called when the notification button is pressed.
  @override
  @pragma('vm:entry-point')
  void onNotificationButtonPressed(String id) {
    print('onNotificationButtonPressed: $id');
  }

  // Called when the notification itself is pressed.
  @override
  @pragma('vm:entry-point')
  void onNotificationPressed() {
    print('onNotificationPressed');
  }

  // Called when the notification itself is dismissed.
  @override
  @pragma('vm:entry-point')
  void onNotificationDismissed() {
    print('onNotificationDismissed');
  }
}
