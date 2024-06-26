import 'package:animate_do/animate_do.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class LlmApiSelector extends StatelessWidget {
  const LlmApiSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    final l10n = context.l10n;

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => switch (state) {
        SettingsLoading() => const Center(child: AppLoading()),
        SettingsFailure(failure: final failure) => LlmApiTile(
            icon: const Icon(CupertinoIcons.exclamationmark_triangle),
            name: context.failureTitle(failure),
            description: context.failureMessage(failure),
          ),
        SettingsData(
          llmApi: final llmApi,
          llmProviders: final llmProviders,
          llmModels: final models,
        ) =>
          Column(
            children: [
              if (llmApi != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        onChanged: bloc.setUrl,
                        placeholder: l10n.apiUrl,
                        enabled: llmApi.type == LlmProviderType.ollama,
                        value: llmApi.url,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        onChanged: bloc.setApiKey,
                        placeholder: l10n.apiKey,
                        value: llmApi.apiKey,
                      ),
                    ),
                  ],
                ),
                if (llmApi.type == LlmProviderType.ollama) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          key: ValueKey(llmApi.modelId),
                          autofocus: llmApi.modelId.isNotEmpty,
                          onChanged: bloc.setModelId,
                          placeholder: l10n.modelId,
                          value: llmApi.modelId,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
              const SizedBox(height: 16),
              if (models.isNotEmpty && llmApi != null)
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: models.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: AppResponsive.value(
                        context,
                        3,
                        mobileValue: 1,
                        tabletValue: 2,
                      ),
                      childAspectRatio:
                          AppResponsive.value(context, 2.2, mobileValue: 3.2),
                    ),
                    itemBuilder: (context, index) {
                      final model = models[index];

                      return ZoomIn(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12, bottom: 12),
                          child: AppWidgetButton(
                            onPressed: () => bloc.setModelId(model.modelId),
                            child: LlmModelTile(
                              icon: llmApi.type.icon,
                              model: model,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (llmApi == null)
                Expanded(
                  child: ListView.builder(
                    itemCount: llmProviders.length,
                    itemBuilder: (context, index) {
                      final provider = llmProviders[index];

                      return SlideInLeft(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 300),
                        child: AppWidgetButton(
                          onPressed: () => bloc.selectProvider(provider),
                          child: LlmApiTile(
                            icon: provider.icon,
                            name: provider.name,
                            description: provider.description,
                            url: provider.web,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16),
              if (state.isValid)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 300),
                      child: AppButton(
                        onPressed: bloc.save,
                        text: l10n.save,
                      ),
                    ),
                  ],
                ),
            ],
          ),
      },
    );
  }
}
