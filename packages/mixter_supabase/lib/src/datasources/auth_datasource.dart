import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource extends SupabaseDataSource {
  const AuthDataSource();

  Stream<AuthState> get authStateChanges => supabase.auth.onAuthStateChange;

  User? currentUser() => supabase.auth.currentUser;
}
