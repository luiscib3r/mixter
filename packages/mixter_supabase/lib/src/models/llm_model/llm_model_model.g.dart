// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llm_model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LlmModelModel _$LlmModelModelFromJson(Map<String, dynamic> json) =>
    LlmModelModel(
      id: json['id'] as String,
      modelId: json['model_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      context: (json['context'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$LlmModelModelToJson(LlmModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'context': instance.context,
      'model_id': instance.modelId,
      'created_at': instance.createdAt.toIso8601String(),
    };
