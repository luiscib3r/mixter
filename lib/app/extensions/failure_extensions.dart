import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

extension FailureExtension on BuildContext {
  Future<void> showFailure(Failure failure) => AppDialog.show(
        this,
        title: failureTitle(failure),
        content: Text(failureMessage(failure), textAlign: TextAlign.center),
      );
}

extension FailureMessagesExtension on BuildContext {
  String failureTitle(Failure failure) => switch (failure) {
        UnknownFailure() => l10n.unknownFailure,
        AuthFailure() => l10n.authFailure,
        SecureKeyNotFound() => l10n.secureKeyNotFound,
        ModelCreationFailure() => l10n.creationFailed,
      };

  String failureMessage(Failure failure) => switch (failure) {
        UnknownFailure(exception: final exception) => exception.toString(),
        AuthFailure(message: final message) => message,
        SecureKeyNotFound(message: final message) => message,
        ModelCreationFailure(message: final message) => message,
      };
}
