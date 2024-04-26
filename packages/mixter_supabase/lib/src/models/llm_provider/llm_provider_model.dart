import 'package:json_annotation/json_annotation.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

part 'llm_provider_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LLmProviderModel extends LlmProvider {
  const LLmProviderModel({
    required super.id,
    required super.name,
    required super.description,
    required super.url,
    required super.web,
    required super.type,
    required this.createdAt,
  }) : super(createdAt: createdAt);

  factory LLmProviderModel.fromJson(Map<String, dynamic> json) =>
      _$LLmProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$LLmProviderModelToJson(this);

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}
