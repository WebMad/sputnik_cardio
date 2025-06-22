import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import 'gentle_perm_data.dart';

abstract interface class GentlePerm {
  Permission get permission;

  GentlePermData getData(BuildContext context);
}
