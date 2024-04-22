import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_hive/src/datasources/datasources.dart';

export 'llm_api_repository_hive.dart';

extension ErrorHandlerHive on BaseRepository {
  Future<Result<T>> process<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Result.success(result);
    } on HiveKeyNotFound catch (e) {
      return Result.failure(Failure.secureKeyNotFound(e.message));
    } on Exception catch (e) {
      return Result.failure(Failure.unknown(e));
    }
  }
}
