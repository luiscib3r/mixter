import 'package:mixter_bloc/mixter_bloc.dart';

abstract class ChatRepository extends BaseRepository {
  const ChatRepository();

  Future<Result<ChatConversation>> createChatConversation(String message);

  Future<Result<List<ChatConversation>>> getChatConversations();

  Future<Result<ChatConversation>> getChatConversation(String chatId);

  Future<Result<List<ChatMessage>>> getChatMessages(String chatId);
}
