part of 'signin_bloc.dart';

sealed class SignInState extends Entity {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInLoadingState extends SignInState {
  const SignInLoadingState();
}

class SignInFormState extends SignInState {
  const SignInFormState({
    this.email = const UserEmailField.pure(),
    this.password = const UserPasswordField.pure(),
    this.isValid = false,
  });

  final UserEmailField email;
  final UserPasswordField password;
  final bool isValid;

  @override
  List<Object?> get props => [email, password, isValid];

  SignInFormState copyWith({
    UserEmailField? email,
    UserPasswordField? password,
    bool? isValid,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}

class SignInFailureState extends SignInState {
  const SignInFailureState({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class SignInSuccessState extends SignInState {
  const SignInSuccessState();
}
