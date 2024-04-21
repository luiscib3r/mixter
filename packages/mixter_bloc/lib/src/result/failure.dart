part of 'result.dart';

sealed class Failure extends Entity {
  const Failure();

  const factory Failure.unknown(Exception exception) = UnknownFailure;

  @override
  bool? get stringify => true;
}

class UnknownFailure extends Failure {
  const UnknownFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
