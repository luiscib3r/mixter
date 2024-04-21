import 'package:equatable/equatable.dart';

export 'user.dart';

abstract class Entity extends Equatable {
  const Entity();

  @override
  bool? get stringify => true;
}
