import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm_data.dart';

import '../models/gentle_perm.dart';

class BackgroundLocationPerm implements GentlePerm {
  @override
  GentlePermData getData(BuildContext context) {
    return const GentlePermData(
      title: 'Геолокация в фоне',
      description: 'Получение координат в фоновом режиме',
      icon: Icon(Icons.gps_fixed),
    );
  }

  @override
  Permission get permission => Permission.locationAlways;
}
