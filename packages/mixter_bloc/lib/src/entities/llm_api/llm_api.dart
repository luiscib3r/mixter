import 'package:mixter_bloc/src/entities/entities.dart';

part 'llm_model.dart';
part 'llm_provider.dart';

class LlmApi extends Entity {
  const LlmApi({
    required this.name,
    required this.url,
    required this.type,
    required this.modelId,
    this.apiKey,
  });

  final String name;
  final String url;
  final String? apiKey;
  final String modelId;
  final LlmProviderType type;

  @override
  List<Object?> get props => [
        name,
        url,
        apiKey,
        modelId,
        type,
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
    );
  }
}
