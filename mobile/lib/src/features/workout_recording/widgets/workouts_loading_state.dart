import 'package:flutter/material.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class WorkoutsLoadingState extends StatelessWidget {
  const WorkoutsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpukiText(context.tr.workoutListLoading),
    );
  }
}
