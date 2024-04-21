import 'package:mixter_bloc/mixter_bloc.dart';

part 'failure.dart';

sealed class Result<T> extends Entity {
  const Result();

  const factory Result.success(T value) = ResultSuccess;
  const factory Result.failure(Failure failure) = ResultFailure;
}

class ResultSuccess<T> extends Result<T> {
  const ResultSuccess(this.value);

  final T value;

  @override
  List<Object?> get props => [value];
}

class ResultFailure<T> extends Result<T> {
  const ResultFailure(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
