import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/src/datasources/datasources.dart';
import 'package:mixter_supabase/src/exception/exception.dart';
import 'package:mixter_supabase/src/models/models.dart';

class ChatDataSource extends SupabaseDataSource {
  const ChatDataSource();

  Future<ChatConversationModel> createChatConversation(String message) async {
    final data = await supabase.from('chat_conversation').insert({}).select();
    final models = data.map(ChatConversationModel.fromJson);

    if (models.isNotEmpty) {
      final model = models.first;
      await createMessage(
        conversationId: model.id,
        message: message,
        role: UserRole.user,
      );
      return model;
    }

    throw const ModelCreationException('Failed to create chat conversation');
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

    final data = model.toJson()
      ..remove('id')
      ..remove('user_id');

    final results = await supabase.from('chat_message').insert(data).select();
    final models = results.map(ChatMessageModel.fromJson);

    if (models.isNotEmpty) {
      return models.first;
    }

    throw const ModelCreationException('Failed to create chat message');
  }
}
