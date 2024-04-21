part of 'session_bloc.dart';

sealed class SessionEvent extends Entity {
  const SessionEvent();

  const factory SessionEvent.load() = SessionLoad;

  @override
  List<Object?> get props => [];
}

class SessionLoad extends SessionEvent {
  const SessionLoad();
}

class SessionAuthenticated extends SessionEvent {
  const SessionAuthenticated({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}

class SessionUnauthenticated extends SessionEvent {
  const SessionUnauthenticated();
}

class SessionSignOut extends SessionEvent {
  const SessionSignOut();
}
