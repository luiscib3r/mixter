import 'package:mixter_bloc/mixter_bloc.dart';

abstract class ChatRepository extends BaseRepository {
  const ChatRepository();

  Future<Result<ChatConversation>> createChatConversation(String message);
}
