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

class GenerateChatResponse extends ChatEvent {
  const GenerateChatResponse({
    this.initial = false,
  });

  final bool initial;
}

class UpdateGenerationMessage extends ChatEvent {
  const UpdateGenerationMessage(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class FinishGenerationMessage extends ChatEvent {
  const FinishGenerationMessage();
}

class ChatSendMessage extends ChatEvent {
  const ChatSendMessage(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ChatGenerateTitle extends ChatEvent {
  const ChatGenerateTitle();
}
