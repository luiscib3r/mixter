part of 'signin_bloc.dart';

sealed class SignInEvent extends Entity {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [value];
}

class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged({
    required this.value,
  });

  final String value;

  @override
  List<Object?> get props => [value];
}

class SignInSubmitted extends SignInEvent {
  const SignInSubmitted();
}

class SignInFormReset extends SignInEvent {
  const SignInFormReset();
}
