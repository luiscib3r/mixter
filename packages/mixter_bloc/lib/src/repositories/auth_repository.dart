import 'package:mixter_bloc/mixter_bloc.dart';

abstract class AuthRepository extends BaseRepository {
  const AuthRepository();

  Stream<User?> get currentUserStream;

  Future<Result<User?>> currentUser();
}
