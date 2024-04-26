import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_hive/mixter_hive.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';

class LlmApiRepositorySupabase extends LlmApiRepository {
  const LlmApiRepositorySupabase();

  static const _llmApiRemoteDataSource = LlmApiRemoteDataSource();
  static final _llmApiLocalDataSource = LlmApiLocalDataSource();

  @override
  Future<Result<List<LlmProvider>>> getLlmProviders() =>
      process(_llmApiRemoteDataSource.getLlmProviders);

  @override
  Future<Result<LlmApi?>> getLlmApi() => process(() async {
        final api = await _llmApiLocalDataSource.getLlmApi();

        return api;
      });

  @override
  Future<LlmApi?> getLlmApiProvider() async {
    final api = await _llmApiLocalDataSource.getLlmApi();

    return api;
  }

  @override
  Future<Result<void>> setLlmApi(LlmApi api) => process(() async {
        final model = LlmApiModel.fromEntity(api);

        await _llmApiLocalDataSource.setLlmApi(model);
      });
}
