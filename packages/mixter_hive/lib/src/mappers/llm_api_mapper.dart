import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_hive/src/models/models.dart';

extension LlmApiTypeEntityMapper on LlmApiType {
  LlmApiModelType get model => switch (this) {
        LlmApiType.openai => LlmApiModelType.openai,
      };
}

extension LlmApiTypeModelMapper on LlmApiModelType {
  LlmApiType get entity => switch (this) {
        LlmApiModelType.openai => LlmApiType.openai,
      };
}

extension LlmApiProviderEntityMapper on LlmApiProvider {
  LlmApiProviderModel get model => switch (this) {
        LlmApiProvider.openai => LlmApiProviderModel.openai,
        LlmApiProvider.groq => LlmApiProviderModel.groq,
        LlmApiProvider.customOpenai => LlmApiProviderModel.customOpenai,
      };
}

extension LlmApiProviderModelMapper on LlmApiProviderModel {
  LlmApiProvider get entity => switch (this) {
        LlmApiProviderModel.openai => LlmApiProvider.openai,
        LlmApiProviderModel.groq => LlmApiProvider.groq,
        LlmApiProviderModel.customOpenai => LlmApiProvider.customOpenai,
      };
}

extension LlmApiEntityMapper on LlmApi {
  LlmApiModel get model => LlmApiModel()
    ..name = name
    ..url = url
    ..apiKey = apiKey
    ..modelId = modelId
    ..type = type.model
    ..provider = provider.model;
}

extension LlmApiModelMapper on LlmApiModel {
  LlmApi get entity => LlmApi(
        name: name,
        url: url,
        apiKey: apiKey,
        modelId: modelId,
        type: type.entity,
        provider: provider.entity,
      );
}
