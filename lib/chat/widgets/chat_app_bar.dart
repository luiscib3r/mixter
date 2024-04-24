import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.scaffold,
        boxShadow: [
          BoxShadow(
            color: AppColors.scaffold,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ChatAppBarLeading(),
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) => switch (state) {
              ChatData(conversation: final conversation) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 64),
                    Text(conversation.title ?? l10n.untitled),
                    const SizedBox(width: 12),
                    const AppIconButton(icon: CupertinoIcons.pencil),
                  ],
                ),
              _ => const SizedBox.shrink(),
            },
          ),
          const ChatAppBarTrail(showTrash: true),
        ],
      ),
    );
  }
}

class ChatAppBarLeading extends StatelessWidget {
  const ChatAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 12),
        AppWidgetButton(
          onPressed: () => ChatsPage.open(context),
          child: Assets.images.logo.image(width: 64),
        ),
      ],
    );
  }
}

class ChatAppBarTrail extends StatelessWidget {
  const ChatAppBarTrail({
    super.key,
    this.showTrash = false,
  });

  final bool showTrash;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showTrash) ...[
          AppIconButton(
            icon: CupertinoIcons.trash,
            onPressed: () => DeleteChatDialog.show(context),
          ),
          const SizedBox(width: 12),
        ],
        const SettingsButton(),
        const SizedBox(width: 12),
        const UserProfileButton(),
        const SizedBox(width: 12),
      ],
    );
  }
}
