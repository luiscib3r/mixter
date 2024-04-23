// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      id: json['id'] as String,
      content: json['content'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      chatConversationId: json['chat_conversation_id'] as String,
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'role': _$UserRoleEnumMap[instance.role]!,
      'chat_conversation_id': instance.chatConversationId,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.system: 'system',
  UserRole.user: 'user',
  UserRole.assistant: 'assistant',
};
