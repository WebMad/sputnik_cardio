import 'package:flutter/material.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/screens/tracking_screen.dart';

class SputnikMain extends StatefulWidget {
  const SputnikMain({super.key});

  @override
  State<SputnikMain> createState() => _SputnikMainState();
}

class _SputnikMainState extends State<SputnikMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  TrackingScreen(),
                  SizedBox.shrink(),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.fiber_manual_record),
                  text: 'Тренировка',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Профиль',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
