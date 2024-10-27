import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/auth_controller.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class AuthWrapper extends StatefulWidget {
  final AuthController authController;
  final WidgetBuilder builder;

  const AuthWrapper({
    super.key,
    required this.authController,
    required this.builder,
  });

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _initController();
  }

  Future<void> _initController() async {
    if (mounted) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isInitialized ? DepsNodeBinder(
      depsNode: () => widget.authController.depsNode,
      child: Builder(builder: (context) => widget.builder(context)),
    ) : const Scaffold(
      body: Center(
        child: SpukiText('Loading...'),
      ),
    );
  }
}
