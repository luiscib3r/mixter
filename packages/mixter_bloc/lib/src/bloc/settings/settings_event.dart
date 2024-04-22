part of 'settings_bloc.dart';

sealed class SettingsEvent extends Entity {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsLoad extends SettingsEvent {
  const SettingsLoad();
}
