import 'package:animate_do/animate_do.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_ui/mixter_ui.dart';

class ChatMessageTile extends StatelessWidget {
  const ChatMessageTile({
    required this.message,
    super.key,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    const maxWidth = 664.0;
    final width = context.width < maxWidth ? context.width : maxWidth;

    return FadeIn(
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: message.role == UserRole.user
                  ? AppColors.card
                  : AppColors.cardBorder,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.cardBorder,
              ),
            ),
            child: Row(
              children: [
                if (message.role == UserRole.user) ...[
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      CupertinoIcons.person,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Text(
                    message.content,
                    overflow: TextOverflow.clip,
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
