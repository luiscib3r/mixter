import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter/user/user.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const ChatsBody(),
          Align(
            alignment: Alignment.topRight,
            child: AppAvatar(
              tooltip: l10n.userProfile,
              margin: const EdgeInsets.all(16),
              onPressed: () => UserPage.open(context),
              child: const Icon(
                CupertinoIcons.person,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
