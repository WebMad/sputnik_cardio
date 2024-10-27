import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_deps_node.dart';
import 'package:sputnik_cardio/src/common/app_initialize_manager.dart';

class AppInitializeWrapper extends StatefulWidget {
  final Widget child;

  const AppInitializeWrapper({super.key, required this.child});

  @override
  State<AppInitializeWrapper> createState() => _AppInitializeWrapperState();
}

class _AppInitializeWrapperState extends State<AppInitializeWrapper> {
  late final AppInitializeManager _appInitializeManager;

  @override
  void initState() {
    super.initState();

    _appInitializeManager =
        DepsNodeBinder.of<AppDepsNode>(context, listen: false)
            .appInitializeManager;
    _appInitializeManager.init();
  }

  @override
  void dispose() {
    _appInitializeManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
