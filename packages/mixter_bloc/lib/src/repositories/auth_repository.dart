import 'package:mixter_bloc/mixter_bloc.dart';

abstract class AuthRepository extends BaseRepository {
  const AuthRepository();

  Stream<User?> get currentUserStream;

  Future<Result<User?>> currentUser();

  Future<Result<void>> signInWithEmail({
    required String email,
    required String emailRedirectUrl,
  });

  Future<Result<User?>> signInWithPassword({
    required String email,
    required String password,
  });

  Future<Result<User?>> signUp({
    required String email,
    required String password,
  });

  Future<Result<void>> signOut();
}
