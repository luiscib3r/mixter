import 'package:mixter_bloc/mixter_bloc.dart';

abstract class Environment extends Entity {
  const Environment({required this.name});

  final String name;
}
