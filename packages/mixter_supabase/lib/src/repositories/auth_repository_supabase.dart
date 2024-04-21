import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/mixter_supabase.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/mappers/mappers.dart';

class AuthRepositorySupabase extends AuthRepository {
  const AuthRepositorySupabase();

  static const _authDataSource = AuthDataSource();

  @override
  Stream<User?> get currentUserStream => _authDataSource.authStateChanges
      .map((state) => state.session?.user.entity);

  @override
  Future<Result<User?>> currentUser() => process(() async {
        final user = _authDataSource.currentUser();

        return user?.entity;
      });

  @override
  Future<Result<void>> signInWithEmail({
    required String email,
    required String emailRedirectUrl,
  }) =>
      process(
        () => _authDataSource.signInWithEmail(
          email: email,
          emailRedirectUrl: emailRedirectUrl,
        ),
      );

  @override
  Future<Result<User?>> signInWithPassword({
    required String email,
    required String password,
  }) =>
      process(() async {
        final response = await _authDataSource.signInWithPassword(
          email: email,
          password: password,
        );

        return response.user?.entity;
      });

  @override
  Future<Result<User?>> signUp({
    required String email,
    required String password,
  }) =>
      process(() async {
        final response = await _authDataSource.signUp(
          email: email,
          password: password,
        );

        return response.user?.entity;
      });

  @override
  Future<Result<void>> signOut() => process(() => _authDataSource.signOut());
}
