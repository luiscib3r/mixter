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
}
