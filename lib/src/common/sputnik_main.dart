import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/screens/tracking_screen.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

import '../features/auth/auth_di.dart';

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
    final authController = DepsNodeBinder.of<AuthDi>(context).authController;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  const TrackingScreen(),
                  ProfileScreen(authController: authController),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: const Icon(Icons.fiber_manual_record),
                  text: context.tr.helloWorld,
                ),
                Tab(
                  icon: const Icon(Icons.person),
                  text: context.tr.profile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
