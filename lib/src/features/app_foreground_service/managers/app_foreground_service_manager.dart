import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/models/foreground_task_output.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/state_holders/foreground_service_status_state_holder.dart';

import '../helpers/foreground_task_entry_point.dart';
import '../models/foreground_service_status.dart';
import '../state_holders/foreground_service_output_state_holder.dart';

class AppForegroundServiceManager implements Lifecycle {
  final ForegroundServiceStatusStateHolder _foregroundServiceStatusStateHolder;
  final ForegroundServiceOutputStateHolder _foregroundServiceOutputStateHolder;

  Completer? initCompleter;

  AppForegroundServiceManager(
    this._foregroundServiceStatusStateHolder,
    this._foregroundServiceOutputStateHolder,
  );

  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterForegroundTask.initCommunicationPort();

    FlutterForegroundTask.addTaskDataCallback(_onReceiveTaskData);

    _init();
  }

  Future<void> _init() async {
    initCompleter ??= Completer();

    await _requestPermissions();
    _initService();
  }

  Future<void> _requestPermissions() async {
    // // Android 13+, you need to allow notification permission to display foreground service notification.
    // //
    // // iOS: If you need notification, ask for permission.
    // final NotificationPermission notificationPermission =
    //     await FlutterForegroundTask.checkNotificationPermission();
    // if (notificationPermission != NotificationPermission.granted) {
    //   await FlutterForegroundTask.requestNotificationPermission();
    // }
    //
    // if (Platform.isAndroid) {
    //   // Android 12+, there are restrictions on starting a foreground service.
    //   //
    //   // To restart the service on device reboot or unexpected problem, you need to allow below permission.
    //   if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
    //     // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
    //     await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    //   }
    // }
  }

  void _initService() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'sputnik_service',
        channelName: 'Sputnik Cardio keep alive',
        channelDescription:
            'A channel to keep the app alive during your workout',
        onlyAlertOnce: true,
        priority: NotificationPriority.LOW,
        channelImportance: NotificationChannelImportance.LOW,
        visibility: NotificationVisibility.VISIBILITY_SECRET,
        playSound: false,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(5000),
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );

    if (initCompleter?.isCompleted == false) {
      initCompleter?.complete();
      initCompleter = null;
    }
  }

  void _onReceiveTaskData(Object data) {
    if (data is! Map<String, dynamic>) {
      return;
    }

    final output = ForegroundTaskOutput.fromJson(data);

    _foregroundServiceOutputStateHolder.received(output);
  }

  Future<ServiceRequestResult> startService() async {
    await initCompleter?.future;

    final res = await FlutterForegroundTask.isRunningService
        ? await FlutterForegroundTask.restartService()
        : await FlutterForegroundTask.startService(
            // You can manually specify the foregroundServiceType for the service
            // to be started, as shown in the comment below.
            serviceTypes: [
              ForegroundServiceTypes.health,
            ],
            serviceId: 256,
            notificationTitle: 'Тренировка в процессе',
            notificationText: 'Помогает приложению работать в фоне',
            notificationIcon: null,
            notificationInitialRoute: '/',
            callback: startCallbackForForegroundService,
          );

    _foregroundServiceStatusStateHolder.update(
      res is ServiceRequestSuccess
          ? ForegroundServiceStatus.started
          : ForegroundServiceStatus.idle,
    );

    return res;
  }

  Future<ServiceRequestResult> stopService() async {
    await initCompleter?.future;

    final res = await FlutterForegroundTask.stopService();

    _foregroundServiceStatusStateHolder.update(
      res is ServiceRequestSuccess
          ? ForegroundServiceStatus.idle
          : ForegroundServiceStatus.started,
    );

    return res;
  }

  @override
  Future<void> dispose() async {
    FlutterForegroundTask.removeTaskDataCallback(_onReceiveTaskData);
    await stopService();
  }
}
