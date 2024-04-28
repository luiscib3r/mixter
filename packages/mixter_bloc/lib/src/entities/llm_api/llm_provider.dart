// ignore_for_file: lines_longer_than_80_chars

part of 'llm_api.dart';

enum LlmProviderType {
  groq,
  openai,
  ollama,
}

class LlmProvider extends Entity {
  const LlmProvider({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.web,
    required this.type,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String description;
  final String url;
  final String web;
  final LlmProviderType type;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, name, description, url, web, type, createdAt];
}
