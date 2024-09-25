import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../models/user.dart';

abstract interface class AuthDataSource {
  Future<User?> getAuthedUser();
}

class SupabaseAuthDataSource implements AuthDataSource {
  final supabase.SupabaseClient _supabaseClient;

  SupabaseAuthDataSource(this._supabaseClient);

  @override
  Future<User?> getAuthedUser() async {
    final user = (await _supabaseClient.auth.getUser()).user;

    if (user == null) {
      return null;
    }

    _supabaseClient.auth.updateUser();

    return User(uuid: user.id, name: user.);
  }
}
