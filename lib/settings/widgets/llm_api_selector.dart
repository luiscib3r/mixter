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
          apiProviders: final apiProviders,
          llmModels: final models,
          requiredFields: final fields,
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
                        enabled: fields.contains(LlmApiField.url),
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
                const SizedBox(height: 8),
                if (models.isEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          onChanged: bloc.setModelId,
                          placeholder: l10n.modelId,
                          value: llmApi.apiKey,
                        ),
                      ),
                    ],
                  ),
              ],
              if (models.isNotEmpty && llmApi != null)
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: models.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.8,
                    ),
                    itemBuilder: (context, index) {
                      final model = models[index];

                      return ZoomIn(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 300),
                        child: AppWidgetButton(
                          onPressed: () => bloc.setModelId(model.id),
                          child: LlmModelTile(
                            icon: llmApi.provider.icon,
                            model: model,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (llmApi == null)
                Expanded(
                  child: ListView.builder(
                    itemCount: apiProviders.length,
                    itemBuilder: (context, index) {
                      final apiProvider = apiProviders[index];

                      return SlideInLeft(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 300),
                        child: AppWidgetButton(
                          onPressed: () => bloc.selectApiProvider(apiProvider),
                          child: LlmApiTile(
                            icon: apiProvider.icon,
                            name: apiProvider.name,
                            description: apiProvider.description,
                            url: apiProvider.providerUrl,
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
                        onPressed: () {},
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
