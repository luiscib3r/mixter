import 'package:animate_do/animate_do.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class LlmApiProvidersWidget extends StatelessWidget {
  const LlmApiProvidersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => switch (state) {
        SettingsLoading() => const Center(child: AppLoading()),
        SettingsFailure(failure: final failure) => LlmApiTile(
            icon: const Icon(CupertinoIcons.exclamationmark_triangle),
            name: context.failureTitle(failure),
            description: context.failureMessage(failure),
          ),
        SettingsData(apiProviders: final apiProviders) => ListView.builder(
            itemCount: apiProviders.length,
            itemBuilder: (context, index) {
              final apiProvider = apiProviders[index];

              return SlideInLeft(
                delay: Duration(milliseconds: index * 100),
                duration: const Duration(milliseconds: 300),
                child: LlmApiTile(
                  icon: apiProvider.icon,
                  name: apiProvider.name,
                  description: apiProvider.description,
                ),
              );
            },
          ),
      },
    );
  }
}

extension LlmApiProviderDataX on LlmApiProviderData {
  Widget get icon => switch (this) {
        OpenAiProvider() => Assets.images.openai.image(),
        GroqProvider() => Assets.images.groq.image(),
        CustomOpenAiProvider() => Assets.images.ollama.image(),
      };
}
