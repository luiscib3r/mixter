// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llm_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LlmApiModel _$LlmApiModelFromJson(Map<String, dynamic> json) => LlmApiModel(
      name: json['name'] as String,
      url: json['url'] as String,
      type: $enumDecode(_$LlmProviderTypeEnumMap, json['type']),
      modelId: json['modelId'] as String,
      apiKey: json['apiKey'] as String?,
    );

Map<String, dynamic> _$LlmApiModelToJson(LlmApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'apiKey': instance.apiKey,
      'modelId': instance.modelId,
      'type': _$LlmProviderTypeEnumMap[instance.type]!,
    };

const _$LlmProviderTypeEnumMap = {
  LlmProviderType.groq: 'groq',
  LlmProviderType.openai: 'openai',
  LlmProviderType.ollama: 'ollama',
};
