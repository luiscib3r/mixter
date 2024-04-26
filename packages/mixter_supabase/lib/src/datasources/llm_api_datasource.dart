import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/models/models.dart';

class LlmApiRemoteDataSource extends SupabaseDataSource {
  const LlmApiRemoteDataSource();

  Future<List<LLmProviderModel>> getLlmProviders() async {
    final data = await supabase.from('llm_provider').select();

    return data.map(LLmProviderModel.fromJson).toList();
  }
}
