import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/mixter_supabase.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';

class ChatRepositorySupabase extends ChatRepository {
  const ChatRepositorySupabase();

  static const _chatDataSource = ChatDataSource();

  @override
  Future<Result<ChatConversation>> createChatConversation(String message) =>
      process(() => _chatDataSource.createChatConversation(message));
}
