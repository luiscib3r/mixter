import 'package:equatable/equatable.dart';

export 'llm_api/llm_api.dart';
export 'user.dart';

abstract class Entity extends Equatable {
  const Entity();

  @override
  bool? get stringify => true;
}
