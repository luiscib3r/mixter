part of 'settings_bloc.dart';

sealed class SettingsEvent extends Entity {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsLoad extends SettingsEvent {
  const SettingsLoad();
}

class SettingsSelectLlmProvider extends SettingsEvent {
  const SettingsSelectLlmProvider(this.value);

  final LlmProvider value;

  @override
  List<Object?> get props => [value];
}

class SettingsSetUrl extends SettingsEvent {
  const SettingsSetUrl(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class SettingsSetApiKey extends SettingsEvent {
  const SettingsSetApiKey(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class SettingsSetModelId extends SettingsEvent {
  const SettingsSetModelId(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class SettingsSave extends SettingsEvent {
  const SettingsSave();
}
