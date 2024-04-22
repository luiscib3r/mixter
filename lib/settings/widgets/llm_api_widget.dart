import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class LlmApiWidget extends StatelessWidget {
  const LlmApiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<SettingsBloc>();

    return Container(
      height: 96,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settings) {
          if (settings is SettingsData && settings.llmApi != null) {
            return LlmApiTile(
              icon: settings.llmApi!.provider.icon,
              name: settings.llmApi!.name,
              description: settings.llmApi!.modelId.isEmpty
                  ? l10n.selectLlmModel
                  : settings.llmApi!.modelId,
              suffixAction: bloc.reload,
            );
          }

          return BlocBuilder<LlmApiBloc, LlmApiState>(
            builder: (context, state) {
              if (state is LlmApiData && state.llmApi == null) {
                return LlmApiTile(
                  icon: Assets.images.logo.image(),
                  name: l10n.nullLlmProvider,
                  description: l10n.nullLlmApiProviderDescription,
                );
              }

              if (state is LlmApiData && state.llmApi != null) {
                return LlmApiTile(
                  icon: state.llmApi!.provider.icon,
                  name: state.llmApi!.name,
                  description: state.llmApi!.modelId,
                );
              }

              return const Center(
                child: AppLoading(),
              );
            },
          );
        },
      ),
    );
  }
}
