import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

extension FailureExtension on BuildContext {
  Future<void> showFailure(Failure failure) => AppDialog.show(
        this,
        title: _failureTitle(failure),
        content: Text(_failureMessage(failure), textAlign: TextAlign.center),
      );
}

extension FailureMessagesExtension on BuildContext {
  String _failureTitle(Failure failure) => switch (failure) {
        UnknownFailure() => l10n.unknownFailure,
        AuthFailure() => l10n.authFailure,
      };

  String _failureMessage(Failure failure) => switch (failure) {
        UnknownFailure(exception: final exception) => exception.toString(),
        AuthFailure(message: final message) => message,
      };
}
