import 'package:hive/hive.dart';

part 'llm_api_model.g.dart';

@HiveType(typeId: 1)
enum LlmApiModelType {
  @HiveField(0)
  openai,
}

@HiveType(typeId: 2)
enum LlmApiProviderModel {
  @HiveField(0)
  openai,
  @HiveField(1)
  groq,
  @HiveField(2)
  customOpenai,
}

@HiveType(typeId: 3)
class LlmApiModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String? apiKey;
  @HiveField(3)
  late String modelId;
  @HiveField(4)
  late LlmApiModelType type;
  @HiveField(5)
  late LlmApiProviderModel provider;
}
