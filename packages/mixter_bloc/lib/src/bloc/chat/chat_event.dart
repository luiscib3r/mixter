part of 'chat_bloc.dart';

sealed class ChatEvent extends Entity {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class ChatLoadConversation extends ChatEvent {
  const ChatLoadConversation({
    required this.chatId,
  });

  final String chatId;

  @override
  List<Object?> get props => [chatId];
}

class ChatLoadMessages extends ChatEvent {
  const ChatLoadMessages();
}

class ChatDeleteChat extends ChatEvent {
  const ChatDeleteChat();
}

class ChatUpdateTitle extends ChatEvent {
  const ChatUpdateTitle(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}
