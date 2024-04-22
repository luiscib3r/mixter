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
    llmApiRepository: context.read(),
  );
}
