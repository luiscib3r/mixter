part of 'llm_api_bloc.dart';

sealed class LlmApiEvent extends Entity {
  const LlmApiEvent();

  @override
  List<Object?> get props => [];
}

class LlmApiLoad extends LlmApiEvent {
  const LlmApiLoad();
}
