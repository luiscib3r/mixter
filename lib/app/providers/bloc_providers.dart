import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

SessionBloc sessionBlocProvider(BuildContext context) {
  return SessionBloc(
    authRepository: context.read(),
  );
}

SignInBloc signInBlocProvider(BuildContext context) {
  return SignInBloc(
    authRepository: context.read(),
  );
}

LlmApiBloc llmApiBlocProvider(BuildContext context) {
  return LlmApiBloc(
    sessionBloc: context.read(),
    llmApiRepository: context.read(),
  );
}

SettingsBloc settingsBlocProvider(BuildContext context) {
  return SettingsBloc(
    llmApiBloc: context.read(),
    llmApiRepository: context.read(),
  );
}

ChatsBloc chatsBlocProvider(BuildContext context) {
  return ChatsBloc(
    chatRepository: context.read(),
  );
}

ChatBloc chatBlocProvider(BuildContext context) {
  return ChatBloc(
    llmRepository: context.read(),
    chatRepository: context.read(),
  );
}
