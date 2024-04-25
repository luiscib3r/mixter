import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

abstract class ChatRepository extends BaseRepository {
  const ChatRepository();

  Future<void> conversationInit(String id);

  Future<Result<ChatConversation>> createChatConversation(String message);

  Future<Result<List<ChatConversation>>> getChatConversations();

  Future<Result<ChatConversation>> getChatConversation(String chatId);

  Future<Result<List<ChatMessage>>> getChatMessages(String chatId);

  Future<void> deleteChat(String chatId);

  Future<Result<ChatConversation>> updateTitle({
    required String chatId,
    required String title,
  });

  Future<Result<ChatMessage>> sendMessage({
    required String chatId,
    required String message,
    required UserRole role,
  });
}
