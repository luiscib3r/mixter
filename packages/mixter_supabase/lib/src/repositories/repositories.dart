import 'package:mixter_bloc/mixter_bloc.dart';

export 'auth_repository_supabase.dart';

extension ErrorHandler on BaseRepository {
  Future<Result<T>> process<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(Failure.unknown(e));
    }
  }
}
