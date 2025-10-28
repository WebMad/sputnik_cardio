import 'package:flutter/material.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

class WorkoutsErrorState extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback onRetry;

  const WorkoutsErrorState({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? context.tr.workoutListError,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(context.tr.retry),
          ),
        ],
      ),
    );
  }
}