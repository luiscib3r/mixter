import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatMessageInput extends StatelessWidget {
  const ChatMessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: 96,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.textField,
        // Border top, left and right
        border: Border(
          top: BorderSide(
            color: AppColors.cardBorder,
          ),
          left: BorderSide(
            color: AppColors.cardBorder,
          ),
          right: BorderSide(
            color: AppColors.cardBorder,
          ),
        ),
        // Circular top
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        // Blur shadow to the top
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, -4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          AppTextField(
            placeholder: '${l10n.messageTo} ${l10n.appName}',
            decoration: const BoxDecoration(),
            suffixMode: OverlayVisibilityMode.editing,
            suffix: Container(
              margin: const EdgeInsets.only(right: 4),
              child: AppWidgetButton(
                onPressed: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_up,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          BlocBuilder<LlmApiBloc, LlmApiState>(
            builder: (context, state) => switch (state) {
              LlmApiData(llmApi: final api) => api != null
                  ? Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          '${api.name} - ${api.modelId}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              _ => const SizedBox(),
            },
          ),
        ],
      ),
    );
  }
}
