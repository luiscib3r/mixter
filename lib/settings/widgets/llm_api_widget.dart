import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class LlmApiWidget extends StatelessWidget {
  const LlmApiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: 96,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<LlmApiBloc, LlmApiState>(
        builder: (context, state) {
          if (state is LlmApiData && state.llmApi == null) {
            return LlmApiTile(
              icon: Assets.images.logo.image(),
              name: l10n.nullLlmProvider,
              description: l10n.nullLlmApiProviderDescription,
            );
          }

          return const Center(
            child: AppLoading(),
          );
        },
      ),
    );
  }
}

class LlmApiTile extends StatelessWidget {
  const LlmApiTile({
    required this.icon,
    required this.name,
    required this.description,
    super.key,
  });

  final Widget icon;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 64,
            child: icon,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
