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
  });

  final List<LlmApiProviderData> apiProviders;

  @override
  List<Object?> get props => [apiProviders];
}

class SettingsFailure extends SettingsState {
  const SettingsFailure({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
