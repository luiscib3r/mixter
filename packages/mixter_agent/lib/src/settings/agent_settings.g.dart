// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentSettings _$AgentSettingsFromJson(Map<String, dynamic> json) =>
    AgentSettings(
      baseUrl: json['baseUrl'] as String,
      apiKey: json['apiKey'] as String,
      modelId: json['modelId'] as String,
    );

Map<String, dynamic> _$AgentSettingsToJson(AgentSettings instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'apiKey': instance.apiKey,
      'modelId': instance.modelId,
    };
