import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sputnik_cardio/src/features/firebase_integration/managers/firebase_manager.dart';

class FirebaseIntegrationDepsNode extends DepsNode {
  late final googleSignIn = bind(
    () => GoogleSignIn(),
  );

  late final firebaseManager = bind(
    () => FirebaseManager(),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {firebaseManager}
      ];
}
