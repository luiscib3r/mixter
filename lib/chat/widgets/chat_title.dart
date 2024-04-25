import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({
    required this.chat,
    super.key,
  });

  final ChatConversation chat;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppWidgetButton(
      onPressed: () => ChatPage.open(context, chatId: chat.id),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                chat.title ?? l10n.untitled,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
