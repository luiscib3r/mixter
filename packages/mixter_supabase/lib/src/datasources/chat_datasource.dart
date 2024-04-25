import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/models/models.dart';

class ChatDataSource extends SupabaseDataSource {
  const ChatDataSource();

  Future<ChatConversationModel> createChatConversation(String message) async {
    final data =
        await supabase.from('chat_conversation').insert({}).select().single();

    await createMessage(
      conversationId: data['id'] as String,
      message: message,
      role: UserRole.user,
      returnModel: false,
    );

    return ChatConversationModel.fromJson(data);
  }

  Future<ChatMessageModel?> createMessage({
    required String conversationId,
    required String message,
    required UserRole role,
    bool returnModel = true,
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

    final request = supabase.from('chat_message').insert(payload);

    if (returnModel) {
      final data = await request.select().single();

      return ChatMessageModel.fromJson(data);
    } else {
      await request;
    }

    return null;
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
        .eq('chat_conversation_id', chatId)
        .order('created_at', ascending: false);
    return data.map(ChatMessageModel.fromJson).toList();
  }

  Future<void> deleteChat(String chatId) async {
    await supabase.from('chat_conversation').delete().eq('id', chatId);
  }

  Future<ChatConversationModel> updateTitle({
    required String chatId,
    required String title,
  }) async {
    final data = await supabase
        .from('chat_conversation')
        .update({'title': title})
        .eq('id', chatId)
        .select()
        .single();
        
    return ChatConversationModel.fromJson(data);
  }
}
