part of 'chats_bloc.dart';

sealed class ChatsEvent extends Entity {
  const ChatsEvent();

  @override
  List<Object?> get props => [];
}

class ChatsLoad extends ChatsEvent {
  const ChatsLoad();
}

class ChatsCreateConversation extends ChatsEvent {
  const ChatsCreateConversation({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
