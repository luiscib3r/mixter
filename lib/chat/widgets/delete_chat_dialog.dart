import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class DeleteChatDialog extends StatelessWidget {
  const DeleteChatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppDialog(
      title: l10n.deleteChatQ,
      content: Column(
        children: [
          const SizedBox(height: 16),
          Text(l10n.deleteChatQuestion),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                color: AppColors.disabled,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                text: l10n.cancel,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 16),
              AppButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                text: l10n.delete,
                onPressed: () {
                  context.read<ChatBloc>().delete();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<void> show(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (_) {
        return RepositoryProvider<ChatBloc>(
          create: (_) => context.read(),
          child: const DeleteChatDialog(),
        );
      },
    );
  }
}
