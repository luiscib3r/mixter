import 'package:mixter_bloc/mixter_bloc.dart';

enum UserRole { system, user, assistant }

class ChatMessage extends Entity {
  const ChatMessage({
    required this.id,
    required this.content,
    required this.role,
    required this.chatConversationId,
    required this.userId,
    required this.createdAt,
  });

  final String id;
  final String content;
  final UserRole role;
  final String chatConversationId;
  final String userId;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        content,
        role,
        chatConversationId,
        userId,
        createdAt,
      ];
}
