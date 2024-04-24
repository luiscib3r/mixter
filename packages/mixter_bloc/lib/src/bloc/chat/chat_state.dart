part of 'chat_bloc.dart';

sealed class ChatState extends Entity {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatLoading extends ChatState {
  const ChatLoading();
}

class ChatData extends ChatState {
  const ChatData({
    required this.conversation,
    required this.messages,
  });

  final ChatConversation conversation;
  final List<ChatMessage> messages;

  @override
  List<Object?> get props => [conversation, messages];
}

class ChatFailure extends ChatState {
  const ChatFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
