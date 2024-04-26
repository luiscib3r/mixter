// ignore_for_file: lines_longer_than_80_chars

part of 'llm_api.dart';

class LlmModel extends Entity {
  const LlmModel({
    required this.id,
    required this.modelId,
    required this.name,
    required this.description,
    required this.context,
    required this.createdAt,
  });

  final String id;
  final String modelId;
  final String name;
  final String description;
  final int context;
  final DateTime createdAt;

  @override
  List<Object?> get props =>
      [id, modelId, name, description, context, createdAt];
}
