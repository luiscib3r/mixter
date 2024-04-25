// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required ChatRepository chatRepository,
    required LlmRepository llmRepository,
  })  : _chatRepository = chatRepository,
        _llmRepository = llmRepository,
        super(const ChatLoading()) {
    on<ChatLoadConversation>(_onLoadConversation);
    on<ChatLoadMessages>(_onLoadMessages);
    on<ChatDeleteChat>(_onDeleteChat);
    on<ChatUpdateTitle>(_onUpdateTitle);
    on<GenerateChatResponse>(_onGenerateChatResponse);
    on<UpdateGenerationMessage>(
      _onUpdateGenerationMessage,
      transformer: sequential(),
    );
    on<FinishGenerationMessage>(_onFinishGenerationMessage);
  }

  final ChatRepository _chatRepository;
  final LlmRepository _llmRepository;

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
        if (!(state as ChatData).conversation.initialized) {
          add(const GenerateChatResponse(initial: true));
        }
      case ResultFailure(failure: final failure):
        emit(ChatFailure(failure: failure));
    }
  }

  void delete() => add(const ChatDeleteChat());

  Future<void> _onDeleteChat(
    ChatDeleteChat event,
    Emitter<ChatState> emit,
  ) async {
    if (state is ChatData) {
      await _chatRepository.deleteChat((state as ChatData).conversation.id);

      emit(const ChatDeleted());
    }
  }

  void updateTitle(String title) => add(ChatUpdateTitle(title));

  Future<void> _onUpdateTitle(
    ChatUpdateTitle event,
    Emitter<ChatState> emit,
  ) async {
    if (state is ChatData) {
      final chatId = (state as ChatData).conversation.id;

      final result = await _chatRepository.updateTitle(
        chatId: chatId,
        title: event.title,
      );

      switch (result) {
        case ResultSuccess(value: final conversation):
          emit(
            ChatData(
              conversation: conversation,
              messages: (state as ChatData).messages,
            ),
          );
        case ResultFailure(failure: final failure):
          emit(ChatFailure(failure: failure));
      }
    }
  }

  void generateResponse() => add(const GenerateChatResponse());

  StreamSubscription<String>? _responseSubscription;

  void _onGenerateChatResponse(
    GenerateChatResponse event,
    Emitter<ChatState> emit,
  ) {
    if (state is! ChatData) return;

    final messages = (state as ChatData).messages;

    if (event.initial) {
      _chatRepository.conversationInit((state as ChatData).conversation.id);
    }

    final stream = _llmRepository.generateChatResponse(messages);

    _responseSubscription = stream.listen(
      (response) {
        add(UpdateGenerationMessage(response));
      },
      onDone: () async {
        add(const FinishGenerationMessage());
      },
    );
  }

  void _onUpdateGenerationMessage(
    UpdateGenerationMessage event,
    Emitter<ChatState> emit,
  ) {
    if (state is ChatData) {
      emit(
        ChatData(
          conversation: (state as ChatData).conversation,
          messages: (state as ChatData).messages,
          generatingMessage:
              '${((state as ChatData).generatingMessage) ?? ''}${event.message}',
        ),
      );
    }
  }

  Future<void> _onFinishGenerationMessage(
    FinishGenerationMessage event,
    Emitter<ChatState> emit,
  ) async {
    final st = state as ChatData;
    final chatId = st.conversation.id;
    final content = st.generatingMessage;

    final result = await _chatRepository.sendMessage(
      chatId: chatId,
      message: content!,
      role: UserRole.assistant,
    );

    await _responseSubscription?.cancel();
    _responseSubscription = null;

    switch (result) {
      case ResultSuccess(value: final message):
        emit(
          ChatData(
            conversation: st.conversation,
            messages: [message, ...st.messages],
          ),
        );
      case ResultFailure():
        add(ChatLoadConversation(chatId: chatId));
    }
  }

  @override
  Future<void> close() async {
    await _responseSubscription?.cancel();
    return super.close();
  }
}
