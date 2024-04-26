import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_hive/mixter_hive.dart';

class LlmApiRepositoryHive extends LlmApiRepository {
  const LlmApiRepositoryHive();

  static final _llmApiDataSource = LlmApiLocalDataSource();

  @override
  Future<Result<LlmApi?>> getLlmApi() => process(() async {
        final api = await _llmApiDataSource.getLlmApi();

        return api;
      });

  @override
  Future<LlmApi?> getLlmApiProvider() async {
    final api = await _llmApiDataSource.getLlmApi();

    return api;
  }

  @override
  Future<Result<void>> setLlmApi(LlmApi api) => process(() async {
        final model = LlmApiModel.fromEntity(api);

        await _llmApiDataSource.setLlmApi(model);
      });

  @override
  Future<Result<List<LlmProvider>>> getLlmProviders() {
    throw UnimplementedError();
  }
}
