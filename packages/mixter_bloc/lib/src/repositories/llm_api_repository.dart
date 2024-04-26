import 'package:mixter_bloc/mixter_bloc.dart';

abstract class LlmApiRepository extends BaseRepository {
  const LlmApiRepository();

  Future<Result<LlmApi?>> getLlmApi();

  Future<LlmApi?> getLlmApiProvider();

  Future<Result<void>> setLlmApi(LlmApi api);

  Future<Result<List<LlmProvider>>> getLlmProviders();
  
}
