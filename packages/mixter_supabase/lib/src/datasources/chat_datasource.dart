import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/models/models.dart';

class ChatDataSource extends SupabaseDataSource {
  const ChatDataSource();

  Future<ChatConversationModel> createChatConversation(String message) async {
    final data =
        await supabase.from('chat_conversation').insert({}).select().single();

    return ChatConversationModel.fromJson(data);
  }

  Future<ChatMessageModel> createMessage({
    required String conversationId,
    required String message,
    required UserRole role,
  }) async {
    final model = ChatMessageModel(
      id: '',
      content: message,
      role: role,
      chatConversationId: conversationId,
      userId: '',
      createdAt: DateTime.now(),
    );

    final payload = model.toJson()
      ..remove('id')
      ..remove('user_id');

    final data =
        await supabase.from('chat_message').insert(payload).select().single();

    return ChatMessageModel.fromJson(data);
  }

  Future<List<ChatConversationModel>> getChatConversations() async {
    final data = await supabase.from('chat_conversation').select();
    return data.map(ChatConversationModel.fromJson).toList();
  }

  Future<ChatConversationModel> getChatConversation(String chatId) async {
    final data = await supabase
        .from('chat_conversation')
        .select()
        .eq('id', chatId)
        .single();
    return ChatConversationModel.fromJson(data);
  }

  Future<List<ChatMessageModel>> getChatMessages(String chatId) async {
    final data = await supabase
        .from('chat_message')
        .select()
        .eq('chat_conversation_id', chatId);
    return data.map(ChatMessageModel.fromJson).toList();
  }
}
