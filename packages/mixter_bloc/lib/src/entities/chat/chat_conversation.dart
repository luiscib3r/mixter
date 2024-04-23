import 'package:mixter_bloc/mixter_bloc.dart';

class ChatConversation extends Entity {
  const ChatConversation({
    required this.id,
    required this.initialized,
    required this.userId,
    required this.createdAt,
    this.title,
  });

  final String id;
  final String? title;
  final bool initialized;
  final String userId;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, title, initialized, userId, createdAt];
}
