import 'package:mixter_bloc/mixter_bloc.dart';

abstract class LlmRepository extends BaseRepository {
  const LlmRepository();

  Future<Result<String>> generateChatTitle(List<ChatMessage> history);

  Stream<String> generateChatResponse(List<ChatMessage> history);
}
