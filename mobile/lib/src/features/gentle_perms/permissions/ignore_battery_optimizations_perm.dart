import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm_data.dart';

import '../models/gentle_perm.dart';

class IgnoreBatteryOptimizationsPerm implements GentlePerm {
  @override
  GentlePermData getData(BuildContext context) {
    return const GentlePermData(
      title: 'Игнорировать оптимизацию батареи',
      description:
          'Помогает точнее определять координаты и работать в фоне даже в режиме энергосбережения',
      icon: Icon(Icons.battery_alert),
    );
  }

  @override
  Permission get permission => Permission.ignoreBatteryOptimizations;
}
