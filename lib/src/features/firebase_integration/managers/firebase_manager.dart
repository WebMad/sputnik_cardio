import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../firebase_options.dart';

class FirebaseManager implements Lifecycle {
  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Permission.systemAlertWindow.request();
  }

  @override
  Future<void> dispose() async {}
}
