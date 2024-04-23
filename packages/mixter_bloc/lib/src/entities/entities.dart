import 'package:equatable/equatable.dart';

export 'auth/auth.dart';
export 'chat/chat.dart';
export 'llm_api/llm_api.dart';

abstract class Entity extends Equatable {
  const Entity();

  @override
  bool? get stringify => true;
}
