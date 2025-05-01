import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class WorkoutTimer extends StatefulWidget {
  const WorkoutTimer({
    super.key,
  });

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  Timer? _timer;

  @override
  void initState() {

    super.initState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
