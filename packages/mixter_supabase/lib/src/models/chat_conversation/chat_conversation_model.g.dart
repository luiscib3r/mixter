// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatConversationModel _$ChatConversationModelFromJson(
        Map<String, dynamic> json) =>
    ChatConversationModel(
      id: json['id'] as String,
      initialized: json['initialized'] as bool,
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChatConversationModelToJson(
        ChatConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'initialized': instance.initialized,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
    };
