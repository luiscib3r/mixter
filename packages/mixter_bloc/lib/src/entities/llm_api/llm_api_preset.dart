// ignore_for_file: lines_longer_than_80_chars

part of 'llm_api.dart';

enum LlmApiField {
  apiKey,
  url,
}

sealed class LlmApiPreset extends Entity {
  const LlmApiPreset({
    required this.name,
    required this.description,
    required this.providerUrl,
  });

  final String name;
  final String description;
  final String providerUrl;

  List<LlmApiField> get requiredFields;
  List<LlmModel> get availableModels;

  LlmApi buildLlmApi({
    required String modelId,
    String? url,
    String? apiKey,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        requiredFields,
      ];
}

class CustomOpenAiPreset extends LlmApiPreset {
  const CustomOpenAiPreset()
      : super(
          name: 'Custom OpenAI',
          description: 'Custom OpenAI API',
          providerUrl: '',
        );

  @override
  List<LlmApiField> get requiredFields => [
        LlmApiField.url,
      ];

  @override
  List<LlmModel> get availableModels => [];

  @override
  LlmApi buildLlmApi({
    required String modelId,
    String? url,
    String? apiKey,
  }) =>
      LlmApi(
        name: 'Custom OpenAI',
        url: url!,
        apiKey: apiKey,
        modelId: modelId,
        type: LlmApiType.openai,
        provider: LlmApiProvider.customOpenai,
      );
}

class OpenAiPreset extends LlmApiPreset {
  const OpenAiPreset()
      : super(
          name: 'OpenAI',
          description: 'The creators of the GPT-3.5 and GPT-4 models.',
          providerUrl: 'https://platform.openai.com/api-keys',
        );

  @override
  List<LlmApiField> get requiredFields => [
        LlmApiField.apiKey,
      ];

  @override
  List<LlmModel> get availableModels => [
        GPT4Turbo(),
        GPT4TurboPreview(),
        GPT3(),
      ];

  @override
  LlmApi buildLlmApi({
    required String modelId,
    String? url,
    String? apiKey,
  }) =>
      LlmApi(
        name: 'OpenAI',
        url: 'https://api.openai.com/v1',
        apiKey: apiKey,
        modelId: modelId,
        type: LlmApiType.openai,
        provider: LlmApiProvider.openai,
      );
}

class GroqPreset extends LlmApiPreset {
  const GroqPreset()
      : super(
          name: 'Groq',
          description:
              'The fastest LLM inferencing available for real-time AI applications.',
          providerUrl: 'https://console.groq.com/keys',
        );

  @override
  List<LlmApiField> get requiredFields => [
        LlmApiField.apiKey,
      ];

  @override
  List<LlmModel> get availableModels => [
        const Llama38B(),
        const Llama370B(),
        const Mixtral8x7B(),
        const Gemma7B(),
      ];

  @override
  LlmApi buildLlmApi({
    required String modelId,
    String? url,
    String? apiKey,
  }) =>
      LlmApi(
        name: 'Groq',
        url: 'https://api.groq.com/openai/v1',
        apiKey: apiKey,
        modelId: modelId,
        type: LlmApiType.openai,
        provider: LlmApiProvider.groq,
      );
}
