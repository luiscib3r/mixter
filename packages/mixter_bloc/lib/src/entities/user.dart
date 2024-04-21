import 'package:mixter_bloc/mixter_bloc.dart';

class User extends Entity {
  const User({
    required this.id,
    required this.email,
  });

  final String id;
  final String email;

  @override
  List<Object?> get props => [id, email];
}
