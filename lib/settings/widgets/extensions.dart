import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

extension LlmApiProviderDataX on LlmApiProviderData {
  Widget get icon => switch (this) {
        OpenAiProvider() => Assets.images.openai.image(),
        GroqProvider() => Assets.images.groq.image(),
        CustomOpenAiProvider() => Assets.images.ollama.image(),
      };
}

extension LlmApiProviderX on LlmApiProvider {
  Widget get icon => switch (this) {
        LlmApiProvider.openai => Assets.images.openai.image(),
        LlmApiProvider.groq => Assets.images.groq.image(),
        LlmApiProvider.customOpenai => Assets.images.ollama.image(),
      };
}
