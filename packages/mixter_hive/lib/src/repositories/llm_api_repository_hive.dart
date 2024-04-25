import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_hive/mixter_hive.dart';
import 'package:mixter_hive/src/datasources/llm_api_datasource.dart';
import 'package:mixter_hive/src/mappers/mappers.dart';

class LlmApiRepositoryHive extends LlmApiRepository {
  const LlmApiRepositoryHive();

  static final _llmApiDataSource = LlmApiDataSource();

  @override
  Future<Result<LlmApi?>> getLlmApi() => process(() async {
        final api = await _llmApiDataSource.getLlmApi();

        return api?.entity;
      });

  @override
  Future<LlmApi?> getLlmApiProvider() async {
    final api = await _llmApiDataSource.getLlmApi();

    return api?.entity;
  }

  @override
  Future<Result<void>> setLlmApi(LlmApi api) => process(() async {
        final model = api.model;

        await _llmApiDataSource.setLlmApi(model);
      });
}
