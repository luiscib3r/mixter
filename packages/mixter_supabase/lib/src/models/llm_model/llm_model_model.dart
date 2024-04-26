import 'package:json_annotation/json_annotation.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'llm_model_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LlmModelModel extends LlmModel {
  const LlmModelModel({
    required super.id,
    required this.modelId,
    required super.name,
    required super.description,
    required super.context,
    required this.createdAt,
  }) : super(modelId: modelId, createdAt: createdAt);

  factory LlmModelModel.fromJson(Map<String, dynamic> json) =>
      _$LlmModelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LlmModelModelToJson(this);

  @override
  @JsonKey(name: 'model_id')
  final String modelId;

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}
