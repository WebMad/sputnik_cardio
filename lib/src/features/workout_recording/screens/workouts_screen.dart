import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // DepsNodeBinder.of<WorkoutLifecycleDepsNode>(context)
    //     .workoutListManager()
    //     .load();
  }

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);

    // final workoutLifecycleDepsNode =
    //     DepsNodeBinder.of<WorkoutLifecycleDepsNode>(context);
    // final workoutsListStateHolder =
    //     workoutLifecycleDepsNode.workoutsListStateHolder();
    //
    // final workoutListManager = workoutLifecycleDepsNode.workoutListManager();

    return const SizedBox.shrink();

    // return SpukiScaffold(
    //   body: SafeArea(
    //     child: RefreshIndicator(
    //       onRefresh: () => workoutListManager.load(),
    //       child: StreamBuilder<List<WorkoutSummary>?>(
    //         initialData: workoutsListStateHolder.state,
    //         stream: workoutsListStateHolder.stream,
    //         builder: (context, snapshot) {
    //           final workouts = snapshot.data;
    //
    //           if (workouts == null) {
    //             return Center(
    //               child: SpukiText(context.tr.workoutListLoading),
    //             );
    //           }
    //
    //           return ListView.builder(
    //             itemCount: workouts.length,
    //             itemBuilder: (context, index) {
    //               final workout = workouts[index];
    //
    //               final startAt = workouts[index].workout.startAt;
    //               return Column(
    //                 children: [
    //                   Container(
    //                     padding: EdgeInsets.symmetric(
    //                       vertical: SpukiTheme.of(context).puk(2),
    //                       horizontal: SpukiTheme.of(context).puk(4),
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 const SpukiText.h2('Тренировка'),
    //                                 if (startAt != null)
    //                                   SpukiText(
    //                                     DateFormat('HH:MM dd.MM.yyyy')
    //                                         .format(startAt),
    //                                   ),
    //                               ],
    //                             ),
    //                             PopupMenuButton<int>(
    //                               icon: const Icon(
    //                                 Icons.more_vert,
    //                                 size: 30,
    //                               ),
    //                               initialValue: -1,
    //                               onSelected: (int item) {
    //                                 if (item == 0) {
    //                                   workoutListManager.removeWorkout(
    //                                     workouts[index].workout.id,
    //                                   );
    //                                 }
    //                               },
    //                               itemBuilder: (BuildContext context) =>
    //                                   <PopupMenuEntry<int>>[
    //                                 const PopupMenuItem<int>(
    //                                   value: 0,
    //                                   child: Text('Remove'),
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                           children: [
    //                             Padding(
    //                               padding:
    //                                   const EdgeInsets.symmetric(vertical: 10),
    //                               child: Column(
    //                                 children: [
    //                                   const SpukiText('Расстояние'),
    //                                   SpukiText(
    //                                     '${workout.metrics.kms.toStringAsFixed(2)} km',
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding:
    //                                   const EdgeInsets.symmetric(vertical: 10),
    //                               child: Column(
    //                                 children: [
    //                                   const SpukiText('Средняя скорость'),
    //                                   SpukiText(
    //                                     '${workout.metrics.avgSpeed.toStringAsFixed(2)} km/h',
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         Align(
    //                           alignment: Alignment.centerRight,
    //                           child: SpukiButton(
    //                             onPressed: () {
    //                               final workoutScreenDepsNode =
    //                                   workoutDepsNode.workoutScreenDepsNode(
    //                                 workout.workout.id,
    //                               );
    //
    //                               Navigator.of(context).push(
    //                                 MaterialPageRoute(
    //                                   builder: (context) => DepsNodeBinder<
    //                                       WorkoutInfoScreenDepsNode>.value(
    //                                     depsNode: workoutScreenDepsNode,
    //                                     child: WorkoutInfoScreen(
    //                                       workoutSummary: workout,
    //                                       workoutLifecycleDepsNode:
    //                                           workoutLifecycleDepsNode,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                             child: const SpukiText('Подробнее'),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   const Divider(),
    //                 ],
    //               );
    //             },
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
