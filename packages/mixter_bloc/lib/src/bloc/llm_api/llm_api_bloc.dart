import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'llm_api_event.dart';
part 'llm_api_state.dart';

class LlmApiBloc extends Bloc<LlmApiEvent, LlmApiState> {
  LlmApiBloc({
    required SessionBloc sessionBloc,
    required LlmApiRepository llmApiRepository,
  })  : _sessionBloc = sessionBloc,
        _llmApiRepository = llmApiRepository,
        super(const LlmApiLoading()) {
    on<LlmApiLoad>(_onLlmApiLoad);

    _sessionSubscription = _sessionBloc.stream.listen((sessionState) {
      if (sessionState is! SessionLoadingState) {
        add(const LlmApiLoad());
      }
    });

    add(const LlmApiLoad());
  }

  final SessionBloc _sessionBloc;
  final LlmApiRepository _llmApiRepository;

  late StreamSubscription<SessionState> _sessionSubscription;

  Future<void> _onLlmApiLoad(
    LlmApiLoad event,
    Emitter<LlmApiState> emit,
  ) async {
    if (_sessionBloc.state is! SessionAuthenticated) {
      emit(const LlmApiData());
      return;
    }

    emit(const LlmApiLoading());

    final result = await _llmApiRepository.getLlmApi();

    switch (result) {
      case ResultSuccess(value: final llmApi):
        emit(LlmApiData(llmApi: llmApi));
      case ResultFailure(failure: final failure):
        emit(LlmApiFailure(failure: failure));
    }
  }

  @override
  Future<void> close() async {
    await _sessionSubscription.cancel();
    return super.close();
  }
}
