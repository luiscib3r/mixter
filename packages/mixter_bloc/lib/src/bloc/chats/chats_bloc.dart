import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const ChatsLoading()) {
    on<ChatsLoad>(_onChatsLoad);
    on<ChatsCreateConversation>(_onChatsCreateConversation);

    add(const ChatsLoad());
  }

  // ignore: unused_field
  final ChatRepository _chatRepository;

  void reload() {
    add(const ChatsLoad());
  }

  Future<void> _onChatsLoad(
    ChatsLoad event,
    Emitter<ChatsState> emit,
  ) async {
    emit(const ChatsLoading());

    await Future<void>.delayed(const Duration(seconds: 2));

    emit(const ChatsData());
  }

  void createConversation(String message) {
    add(ChatsCreateConversation(message: message));
  }

  Future<void> _onChatsCreateConversation(
    ChatsCreateConversation event,
    Emitter<ChatsState> emit,
  ) async {
    final result = await _chatRepository.createChatConversation(event.message);

    switch (result) {
      case ResultSuccess(value: final chatConversation):
        emit(ChatsData(chatId: chatConversation.id));
      case ResultFailure(failure: final failure):
        emit(ChatsFailure(failure: failure));
    }
  }
}
