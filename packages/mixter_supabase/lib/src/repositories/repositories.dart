import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

export 'auth_repository_supabase.dart';

extension ErrorHandler on BaseRepository {
  Future<Result<T>> process<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Result.success(result);
    } on AuthException catch (e) {
      return Result.failure(Failure.auth(e.message));
    } on Exception catch (e) {
      return Result.failure(Failure.unknown(e));
    }
  }
}
