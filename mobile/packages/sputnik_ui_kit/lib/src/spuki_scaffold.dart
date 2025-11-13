import 'package:flutter/material.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class SpukiScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const SpukiScaffold({super.key, this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: SpukiTheme.of(context).scaffoldBackgroundColor,
      body: body,
    );
  }
}
