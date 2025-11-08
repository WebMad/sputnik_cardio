import 'package:flutter/material.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

class WorkoutsEmptyState extends StatelessWidget {
  final VoidCallback onStartNewWorkout;

  const WorkoutsEmptyState({
    super.key,
    required this.onStartNewWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.tr.noWorkouts,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onStartNewWorkout,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[80],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            child: Text(context.tr.recordTrain),
          ),
        ],
      ),
    );
  }
}
