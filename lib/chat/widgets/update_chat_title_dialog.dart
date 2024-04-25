import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class UpdateChatTitleDialog extends StatefulWidget {
  const UpdateChatTitleDialog({
    required this.initialTitle,
    super.key,
  });

  final String? initialTitle;

  @override
  State<UpdateChatTitleDialog> createState() => _UpdateChatTitleDialogState();

  static Future<void> show(BuildContext context, {String? initialTitle}) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => RepositoryProvider<ChatBloc>(
        create: (_) => context.read(),
        child: UpdateChatTitleDialog(initialTitle: initialTitle),
      ),
    );
  }
}

class _UpdateChatTitleDialogState extends State<UpdateChatTitleDialog> {
  late final controller = TextEditingController(text: widget.initialTitle);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppDialog(
      title: l10n.renameChat,
      minWidth: 420,
      content: Column(
        children: [
          const SizedBox(height: 16),
          AppTextField(
            placeholder: l10n.chatTitle,
            controller: controller,
            onSubmit: () {
              if (controller.text.isNotEmpty) {
                context.read<ChatBloc>().updateTitle(controller.text);
                Navigator.pop(context);
              }
            },
          ),
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
                text: l10n.save,
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    context.read<ChatBloc>().updateTitle(controller.text);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
