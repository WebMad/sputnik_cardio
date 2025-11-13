import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm_data.dart';

import '../models/gentle_perm.dart';

class SystemAlertWindowPerm implements GentlePerm {
  @override
  GentlePermData getData(BuildContext context) {
    return const GentlePermData(
      title: 'Поверх других приложений',
      description: 'Используется для поддержания жизни приложения в фоне',
      icon: Icon(Icons.display_settings_outlined),
    );
  }

  @override
  Permission get permission => Permission.systemAlertWindow;
}
