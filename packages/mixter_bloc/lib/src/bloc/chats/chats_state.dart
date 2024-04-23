part of 'chats_bloc.dart';

sealed class ChatsState extends Entity {
  const ChatsState();

  @override
  List<Object?> get props => [];
}

class ChatsLoading extends ChatsState {
  const ChatsLoading();
}

class ChatsData extends ChatsState {
  const ChatsData({
    this.chats = const [],
    this.chatId,
  });

  final String? chatId;
  final List<ChatConversation> chats;

  @override
  List<Object?> get props => [chatId, chats];
}

class ChatsFailure extends ChatsState {
  const ChatsFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
