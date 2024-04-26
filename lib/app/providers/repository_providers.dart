import 'package:mixter/app/app.dart';
import 'package:mixter_ai/mixter_ai.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/mixter_supabase.dart';

AuthRepository authRepositoryProvider(BuildContext context) {
  return const AuthRepositorySupabase();
}

LlmApiRepository llmApiRepositoryProvider(BuildContext context) {
  return const LlmApiRepositorySupabase();
}

ChatRepository chatRepositoryProvider(BuildContext context) {
  return const ChatRepositorySupabase();
}

LlmRepository llmRepositoryProvider(BuildContext context) {
  final llmApiRepository = context.read<LlmApiRepository>();

  return LlmRepositoryAi(
    llmApi: llmApiRepository.getLlmApiProvider,
  );
}
