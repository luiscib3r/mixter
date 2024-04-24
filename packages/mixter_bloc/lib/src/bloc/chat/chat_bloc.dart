import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const ChatLoading()) {
    on<ChatLoadConversation>(_onLoadConversation);
    on<ChatLoadMessages>(_onLoadMessages);
  }

  final ChatRepository _chatRepository;

  void load(String chatId) => add(ChatLoadConversation(chatId: chatId));

  Future<void> _onLoadConversation(
    ChatLoadConversation event,
    Emitter<ChatState> emit,
  ) async {
    final result = await _chatRepository.getChatConversation(event.chatId);

    switch (result) {
      case ResultSuccess(value: final conversation):
        emit(ChatData(conversation: conversation, messages: const []));
        add(const ChatLoadMessages());
      case ResultFailure(failure: final failure):
        emit(ChatFailure(failure: failure));
    }
  }

  Future<void> _onLoadMessages(
    ChatLoadMessages event,
    Emitter<ChatState> emit,
  ) async {
    if (state is! ChatData) return;

    final chatId = (state as ChatData).conversation.id;

    final result = await _chatRepository.getChatMessages(chatId);

    switch (result) {
      case ResultSuccess(value: final messages):
        emit(
          ChatData(
            conversation: (state as ChatData).conversation,
            messages: messages,
          ),
        );
      case ResultFailure(failure: final failure):
        emit(ChatFailure(failure: failure));
    }
  }
}
