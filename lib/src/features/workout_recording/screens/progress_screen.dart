import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/screens/progress_screen_presenter.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import '../models/progress_screen_state.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late ProgressScreenPresenter _presenter;
  bool _dependenciesInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_dependenciesInitialized) {
      _initializeDependencies();
      _dependenciesInitialized = true;
    }
  }

  void _initializeDependencies() {
    final workoutDepsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);
    _presenter = workoutDepsNode.progressScreenPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProgressScreenState>(
      stream: _presenter.asStream,
      initialData: _presenter.state,
      builder: (context, snapshot) {
        final state = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const _ProgressHeader(),
                Expanded(
                  child: _ProgressContent(
                    key: ValueKey(state.charData.join(',')),
                    state: state,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr.progress,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            context.tr.distancePastWeek,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressContent extends StatelessWidget {
  final ProgressScreenState state;

  const _ProgressContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.status == ProgressScreenStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.lastWeekWorkouts.isEmpty) {
      return Center(child: Text(context.tr.noWorkoutsThisWeek));
    }

    return _ProgressChart(state: state);
  }
}

class _ProgressChart extends StatelessWidget {
  final ProgressScreenState state;

  const _ProgressChart({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final dayLabels = [
      AppLocalizations.of(context).mon,
      AppLocalizations.of(context).tue,
      AppLocalizations.of(context).wed,
      AppLocalizations.of(context).thu,
      AppLocalizations.of(context).fri,
      AppLocalizations.of(context).sat,
      AppLocalizations.of(context).sun,
    ];

    final maxDistance = state.charData.isNotEmpty
        ? state.charData.reduce((a, b) => a > b ? a : b)
        : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(state.charData.length, (index) {
                return _ChartBar(
                  value: state.charData[index],
                  maxValue: maxDistance,
                  label: dayLabels[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  final double value;
  final double maxValue;
  final String label;

  const _ChartBar({
    required this.value,
    required this.maxValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final heightFactor = maxValue > 0 ? value / maxValue : 0;
    final barHeight = 120 * heightFactor.toDouble();

    return Expanded(
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Text(
            value.toInt().toString(),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          Container(
            width: 20,
            height: barHeight > 0 ? barHeight : 2,
            decoration: BoxDecoration(
              color: value > 0 ? Colors.grey : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
