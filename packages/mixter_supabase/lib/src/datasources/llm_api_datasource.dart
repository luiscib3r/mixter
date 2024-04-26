import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/models/llm_model/llm_model_model.dart';
import 'package:mixter_supabase/src/models/models.dart';

class LlmApiRemoteDataSource extends SupabaseDataSource {
  const LlmApiRemoteDataSource();

  Future<List<LLmProviderModel>> getLlmProviders() async {
    final data = await supabase.from('llm_provider').select();

    return data.map(LLmProviderModel.fromJson).toList();
  }

  Future<List<LlmModelModel>> getLlmModels(String providerId) async {
    final data = await supabase
        .from('llm_model')
        .select()
        .eq('llm_provider_id', providerId);

    return data.map(LlmModelModel.fromJson).toList();
  }
}
