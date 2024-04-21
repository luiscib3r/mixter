import 'package:formz/formz.dart';

enum UserEmailValidationError { empty, invalid }

class UserEmailField extends FormzInput<String, UserEmailValidationError> {
  const UserEmailField.pure() : super.pure('');
  const UserEmailField.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  @override
  UserEmailValidationError? validator(String value) {
    if (value.isEmpty) return UserEmailValidationError.empty;
    if (!_emailRegExp.hasMatch(value)) return UserEmailValidationError.invalid;

    return null;
  }
}

enum UserPasswordValidationError { empty }

class UserPasswordField
    extends FormzInput<String, UserPasswordValidationError> {
  const UserPasswordField.pure() : super.pure('');
  const UserPasswordField.dirty([super.value = '']) : super.dirty();

  @override
  UserPasswordValidationError? validator(String value) {
    if (value.isEmpty) return UserPasswordValidationError.empty;

    return null;
  }
}
