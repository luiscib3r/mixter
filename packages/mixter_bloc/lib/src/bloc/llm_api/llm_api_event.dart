part of 'llm_api_bloc.dart';

sealed class LlmApiEvent extends Entity {
  const LlmApiEvent();

  @override
  List<Object?> get props => [];
}

class LlmApiLoad extends LlmApiEvent {
  const LlmApiLoad();
}

class LlmApiSetLlmApi extends LlmApiEvent {
  const LlmApiSetLlmApi(this.value);

  final LlmApi value;

  @override
  List<Object?> get props => [value];
}
