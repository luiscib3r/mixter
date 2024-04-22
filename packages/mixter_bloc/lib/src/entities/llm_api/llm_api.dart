import 'package:mixter_bloc/src/entities/entities.dart';

part 'llm_api_provider.dart';
part 'llm_model.dart';

enum LlmApiType {
  openai,
}

enum LlmApiProvider {
  openai,
  groq,
  customOpenai,
}

class LlmApi extends Entity {
  const LlmApi({
    required this.name,
    required this.url,
    required this.type,
    required this.modelId,
    required this.provider,
    this.apiKey,
  });

  final String name;
  final String url;
  final String? apiKey;
  final String modelId;
  final LlmApiType type;
  final LlmApiProvider provider;

  @override
  List<Object?> get props => [
        name,
        url,
        apiKey,
        modelId,
        type,
        provider,
      ];

  LlmApi copyWith({
    String? url,
    String? apiKey,
    String? modelId,
  }) {
    return LlmApi(
      name: name,
      url: url ?? this.url,
      apiKey: apiKey ?? this.apiKey,
      modelId: modelId ?? this.modelId,
      type: type,
      provider: provider,
    );
  }
}
