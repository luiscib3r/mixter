import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SessionState.loading()) {
    on<SessionLoad>(_onSessionLoad);
    on<SessionAuthenticated>(_onSessionAuthenticated);
    on<SessionUnauthenticated>(_onSessionUnauthenticated);
    on<SessionSignOut>(_onSessionSignOut);

    _userSubscription = _authRepository.currentUserStream.listen((user) {
      if (user != null) {
        add(SessionAuthenticated(user: user));
      } else {
        add(const SessionUnauthenticated());
      }
    });

    add(const SessionLoad());
  }

  final AuthRepository _authRepository;

  late final StreamSubscription<User?> _userSubscription;

  Future<void> _onSessionLoad(
    SessionLoad event,
    Emitter<SessionState> emit,
  ) async {
    final result = await _authRepository.currentUser();

    switch (result) {
      case ResultFailure<User?>(failure: final failure):
        emit(SessionState.failure(failure: failure));
      case ResultSuccess<User?>(value: final user):
        if (user != null) {
          emit(SessionState.authenticated(user: user));
        } else {
          emit(const SessionState.unauthenticated());
        }
    }
  }

  void _onSessionAuthenticated(
    SessionAuthenticated event,
    Emitter<SessionState> emit,
  ) {
    emit(SessionState.authenticated(user: event.user));
  }

  void _onSessionUnauthenticated(
    SessionUnauthenticated event,
    Emitter<SessionState> emit,
  ) {
    emit(const SessionState.unauthenticated());
  }

  void signOut() => add(const SessionSignOut());
  void _onSessionSignOut(
    SessionSignOut event,
    Emitter<SessionState> emit,
  ) {
    emit(const SessionState.unauthenticated());
    _authRepository.signOut();
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }
}
