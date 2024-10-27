import 'package:flutter/material.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class SpukiScaffold extends StatelessWidget {
  final Widget? body;

  const SpukiScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpukiTheme.of(context).scaffoldBackgroundColor,
      body: body,
    );
  }
}
