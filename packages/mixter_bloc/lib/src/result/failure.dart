part of 'result.dart';

sealed class Failure extends Entity {
  const Failure();

  const factory Failure.unknown(Exception exception) = UnknownFailure;
  const factory Failure.auth(String message) = AuthFailure;
  const factory Failure.secureKeyNotFound(String message) = SecureKeyNotFound;
  const factory Failure.modelCreation(String message) = ModelCreationFailure;

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

class SecureKeyNotFound extends Failure {
  const SecureKeyNotFound(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ModelCreationFailure extends Failure {
  const ModelCreationFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
