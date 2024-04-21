import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignInFormState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInFormReset>(_onFormReset);
  }

  final AuthRepository _authRepository;

  void emailChanged(String value) => add(SignInEmailChanged(value: value));

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    if (state is SignInFormState) {
      final email = UserEmailField.dirty(event.value);
      final current = state as SignInFormState;
      emit(
        current.copyWith(
          email: email,
          isValid: Formz.validate([email, current.password]),
        ),
      );
    }
  }

  void passwordChanged(String value) =>
      add(SignInPasswordChanged(value: value));

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    if (state is SignInFormState) {
      final password = UserPasswordField.dirty(event.value);
      final current = state as SignInFormState;
      emit(
        current.copyWith(
          password: password,
          isValid: Formz.validate([current.email, password]),
        ),
      );
    }
  }

  void submit() => add(const SignInSubmitted());

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (state is SignInFormState) {
      final current = state as SignInFormState;
      emit(const SignInLoadingState());

      final result = await _authRepository.signInWithPassword(
        email: current.email.value,
        password: current.password.value,
      );

      switch (result) {
        case ResultFailure(failure: final failure):
          emit(SignInFailureState(failure: failure));
        case ResultSuccess():
          emit(const SignInSuccessState());
      }
    }
  }

  void reset() => add(const SignInFormReset());

  void _onFormReset(SignInFormReset event, Emitter<SignInState> emit) {
    emit(const SignInFormState());
  }
}
