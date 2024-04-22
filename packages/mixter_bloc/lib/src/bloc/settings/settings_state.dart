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
    required this.apiProviders,
    this.llmModels = const [],
    this.requiredFields = const [],
    this.llmApi,
  });

  final LlmApi? llmApi;
  final List<LlmApiField> requiredFields;
  final List<LlmModel> llmModels;
  final List<LlmApiProviderData> apiProviders;

  bool get isValid =>
      (llmApi?.url.isNotEmpty ?? false) &&
      (llmApi?.modelId.isNotEmpty ?? false) &&
      (!requiredFields.contains(LlmApiField.apiKey) ||
          (llmApi?.apiKey?.isNotEmpty ?? false));

  @override
  List<Object?> get props => [llmApi, apiProviders];
}

class SettingsFailure extends SettingsState {
  const SettingsFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
