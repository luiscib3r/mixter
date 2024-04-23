import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/src/exception/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

export 'auth_repository_supabase.dart';
export 'chat_repository_supabase.dart';

extension ErrorHandlerSupabase on BaseRepository {
  Future<Result<T>> process<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Result.success(result);
    } on AuthException catch (e) {
      return Result.failure(Failure.auth(e.message));
    } on ModelCreationException catch (e) {
      return Result.failure(Failure.modelCreation(e.message));
    } on Exception catch (e) {
      return Result.failure(Failure.unknown(e));
    }
  }
}
