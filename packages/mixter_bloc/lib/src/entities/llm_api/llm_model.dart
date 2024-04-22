// ignore_for_file: lines_longer_than_80_chars

part of 'llm_api.dart';

class LlmModel extends Entity {
  const LlmModel({
    required this.id,
    required this.name,
    required this.description,
    required this.contextWindow,
    this.trainingData,
  });

  final String id;
  final String name;
  final String description;
  final double contextWindow;
  final DateTime? trainingData;

  @override
  List<Object?> get props => [id, name, description, contextWindow];
}

// Groq Models
class Llama38B extends LlmModel {
  const Llama38B()
      : super(
          id: 'llama3-8b-8192',
          name: 'LlaMA3 8B',
          description: 'Developer Meta',
          contextWindow: 8192,
        );
}

class Llama370B extends LlmModel {
  const Llama370B()
      : super(
          id: 'llama3-70b-8192',
          name: 'LlaMA3 70B',
          description: 'Developer Meta',
          contextWindow: 8192,
        );
}

class Mixtral8x7B extends LlmModel {
  const Mixtral8x7B()
      : super(
          id: 'mixtral-8x7b-32768',
          name: 'Mixtral 8x7b',
          description: 'Developer Mistral',
          contextWindow: 32768,
        );
}

class Gemma7B extends LlmModel {
  const Gemma7B()
      : super(
          id: 'gemma-7b-it',
          name: 'Gemma 7B',
          description: 'Developer Google',
          contextWindow: 8192,
        );
}

// OpenAI Models
class GPT4Turbo extends LlmModel {
  GPT4Turbo()
      : super(
          id: 'gpt-4-turbo',
          name: 'GPT-4 Turbo with Vision',
          description:
              'The latest GPT-4 Turbo model with vision capabilities. Vision requests can now use JSON mode and function calling. Currently points to gpt-4-turbo-2024-04-09.',
          contextWindow: 128000,
          trainingData: DateTime(2023, 12),
        );
}

class GPT4TurboPreview extends LlmModel {
  GPT4TurboPreview()
      : super(
          id: 'gpt-4-turbo-preview',
          name: 'GPT-4 Turbo Preview',
          description:
              'Turbo preview model. Currently points to gpt-4-0125-preview.',
          contextWindow: 128000,
          trainingData: DateTime(2023, 12),
        );
}

class GPT3 extends LlmModel {
  GPT3()
      : super(
          id: 'gpt-3.5-turbo-0125',
          name: 'GPT 3.5 Turbo',
          description:
              'The latest GPT-3.5 Turbo model with higher accuracy at responding in requested formats and a fix for a bug which caused a text encoding issue for non-English language function calls. Returns a maximum of 4,096 output tokens.',
          contextWindow: 16385,
          trainingData: DateTime(2021, 9),
        );
}
