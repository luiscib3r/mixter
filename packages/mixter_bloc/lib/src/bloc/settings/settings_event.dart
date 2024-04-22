part of 'settings_bloc.dart';

sealed class SettingsEvent extends Entity {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsLoad extends SettingsEvent {
  const SettingsLoad();
}

class SettingsSelectApiProvider extends SettingsEvent {
  const SettingsSelectApiProvider(this.value);

  final LlmApiProviderData value;

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
