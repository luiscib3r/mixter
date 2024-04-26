import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

extension LlmProviderX on LlmProvider {
  Widget get icon => switch (type) {
        LlmProviderType.openai => Assets.images.openai.image(),
        LlmProviderType.groq => Assets.images.groq.image(),
      };
}

extension LlmApiProviderTypeX on LlmProviderType {
  Widget get icon => switch (this) {
        LlmProviderType.openai => Assets.images.openai.image(),
        LlmProviderType.groq => Assets.images.groq.image(),
      };
}
