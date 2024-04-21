import 'package:equatable/equatable.dart';

export 'environment.dart';

abstract class Entity extends Equatable {
  const Entity();

  @override
  bool? get stringify => true;
}
