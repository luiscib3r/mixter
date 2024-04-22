part of 'llm_api_bloc.dart';

sealed class LlmApiState extends Entity {
  const LlmApiState();

  @override
  List<Object?> get props => [];
}

class LlmApiLoading extends LlmApiState {
  const LlmApiLoading();
}

class LlmApiData extends LlmApiState {
  const LlmApiData({
    this.llmApi,
  });

  final LlmApi? llmApi;

  @override
  List<Object?> get props => [llmApi];
}

class LlmApiFailure extends LlmApiState {
  const LlmApiFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
