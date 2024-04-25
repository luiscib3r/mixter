import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/mixter_supabase.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';

class ChatRepositorySupabase extends ChatRepository {
  const ChatRepositorySupabase();

  static const _chatDataSource = ChatDataSource();

  @override
  Future<Result<ChatConversation>> createChatConversation(String message) =>
      process(() => _chatDataSource.createChatConversation(message));

  @override
  Future<Result<List<ChatConversation>>> getChatConversations() =>
      process(_chatDataSource.getChatConversations);

  @override
  Future<Result<ChatConversation>> getChatConversation(String chatId) =>
      process(() => _chatDataSource.getChatConversation(chatId));

  @override
  Future<Result<List<ChatMessage>>> getChatMessages(String chatId) =>
      process(() => _chatDataSource.getChatMessages(chatId));

  @override
  Future<void> deleteChat(String chatId) => _chatDataSource.deleteChat(chatId);

  @override
  Future<Result<ChatConversation>> updateTitle({
    required String chatId,
    required String title,
  }) =>
      process(() => _chatDataSource.updateTitle(chatId: chatId, title: title));
}
