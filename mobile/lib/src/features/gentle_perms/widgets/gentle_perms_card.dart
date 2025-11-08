import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/state_holders/actual_perms_state_holder.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../di/gentle_perms_deps_node.dart';

class GentlePermsCard extends StatefulWidget {
  const GentlePermsCard({super.key});

  @override
  State<GentlePermsCard> createState() => _GentlePermsCardState();
}

class _GentlePermsCardState extends State<GentlePermsCard>
    with WidgetsBindingObserver {
  late GentlePermsDepsNode gentlePermsDepsNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      gentlePermsDepsNode.gentlePermsManager().actualize();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gentlePermsDepsNode =
        context.depsNode<AuthScopeDepsNode>().gentlePermsDepsNode();

    gentlePermsDepsNode.gentlePermsManager().actualize();
  }

  @override
  Widget build(BuildContext context) {
    final gentlePermsStateHolder = gentlePermsDepsNode.actualPermsStateHolder();

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: StateHolderBuilder<ActualPermsStateHolder, Set<GentlePerm>>(
              holder: gentlePermsStateHolder,
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SpukiText.h3(
                        'Для записи тренировки необходимо выдать разрешения:',
                      ),
                    ),
                    for (final perm in state)
                      ListTile(
                        leading: perm.getData(context).icon,
                        title: Text(perm.getData(context).title),
                        subtitle: Text(perm.getData(context).description),
                        trailing: SpukiButton(
                          onPressed: () => gentlePermsDepsNode
                              .gentlePermsManager()
                              .request(perm),
                          child: const Text('Выдать'),
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
