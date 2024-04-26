// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llm_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LLmProviderModel _$LLmProviderModelFromJson(Map<String, dynamic> json) =>
    LLmProviderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      web: json['web'] as String,
      type: $enumDecode(_$LlmProviderTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$LLmProviderModelToJson(LLmProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'web': instance.web,
      'type': _$LlmProviderTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$LlmProviderTypeEnumMap = {
  LlmProviderType.groq: 'groq',
  LlmProviderType.openai: 'openai',
};
