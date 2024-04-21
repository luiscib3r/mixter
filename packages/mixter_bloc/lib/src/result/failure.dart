part of 'result.dart';

sealed class Failure extends Entity {
  const Failure();

  const factory Failure.unknown(Exception exception) = UnknownFailure;
  const factory Failure.auth(String message) = AuthFailure;

  @override
  bool? get stringify => true;
}

class UnknownFailure extends Failure {
  const UnknownFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

class AuthFailure extends Failure {
  const AuthFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
