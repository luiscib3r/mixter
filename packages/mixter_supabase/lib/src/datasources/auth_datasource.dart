import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource extends SupabaseDataSource {
  const AuthDataSource();

  Stream<AuthState> get authStateChanges => supabase.auth.onAuthStateChange;

  User? currentUser() => supabase.auth.currentUser;

  Future<void> signInWithEmail({
    required String email,
    required String emailRedirectUrl,
  }) =>
      supabase.auth.signInWithOtp(
        email: email,
        emailRedirectTo: emailRedirectUrl,
      );

  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) =>
      supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) =>
      supabase.auth.signUp(
        email: email,
        password: password,
      );

  Future<void> signOut() => supabase.auth.signOut();
}
