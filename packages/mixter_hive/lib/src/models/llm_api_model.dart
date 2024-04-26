import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'llm_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LlmApiModel extends LlmApi {
  const LlmApiModel({
    required super.name,
    required super.url,
    required super.type,
    required super.modelId,
    super.apiKey,
  });

  factory LlmApiModel.fromEntity(LlmApi entity) => LlmApiModel(
        name: entity.name,
        url: entity.url,
        type: entity.type,
        modelId: entity.modelId,
        apiKey: entity.apiKey,
      );

  factory LlmApiModel.fromJson(Map<String, dynamic> json) =>
      _$LlmApiModelFromJson(json);

  factory LlmApiModel.decode(String rawData) =>
      LlmApiModel.fromJson(json.decode(rawData) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$LlmApiModelToJson(this);

  String encode() => json.encode(toJson());
}
