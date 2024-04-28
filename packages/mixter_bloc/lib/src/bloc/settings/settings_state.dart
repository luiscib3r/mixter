part of 'settings_bloc.dart';

sealed class SettingsState extends Entity {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

class SettingsData extends SettingsState {
  const SettingsData({
    required this.llmProviders,
    this.llmModels = const [],
    this.llmApi,
  });

  final LlmApi? llmApi;
  final List<LlmModel> llmModels;
  final List<LlmProvider> llmProviders;

  bool get isValid =>
      (llmApi?.url.isNotEmpty ?? false) &&
      (llmApi?.modelId.isNotEmpty ?? false) &&
      (llmApi?.apiKey?.isNotEmpty ??
          false || llmApi?.type == LlmProviderType.ollama);

  @override
  List<Object?> get props => [llmApi, llmProviders, llmModels];
}

class SettingsFailure extends SettingsState {
  const SettingsFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
