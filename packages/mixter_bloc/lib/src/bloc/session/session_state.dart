part of 'session_bloc.dart';

sealed class SessionState extends Entity {
  const SessionState();

  const factory SessionState.loading() = SessionLoadingState;
  const factory SessionState.authenticated({required User user}) =
      SessionAuthenticatedState;
  const factory SessionState.unauthenticated() = SessionUnauthenticatedState;

  const factory SessionState.failure({required Failure failure}) =
      SessionFailureState;

  @override
  List<Object?> get props => [];
}

class SessionLoadingState extends SessionState {
  const SessionLoadingState();
}

class SessionAuthenticatedState extends SessionState {
  const SessionAuthenticatedState({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}

class SessionUnauthenticatedState extends SessionState {
  const SessionUnauthenticatedState();
}

class SessionFailureState extends SessionState {
  const SessionFailureState({
    required this.failure,
  });

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
