import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter/user/user.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<ChatsBloc, ChatsState>(
      listenWhen: (prev, curr) => curr is ChatsData && curr.chatId != null,
      listener: (context, state) => ChatPage.open(
        context,
        chatId: (state as ChatsData).chatId!,
      ),
      child: AppScaffold(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ChatsBody(),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIconButton(
                    tooltip: l10n.settings,
                    icon: CupertinoIcons.settings,
                    onPressed: () => SettingsPage.open(context),
                  ),
                  const SizedBox(width: 12),
                  AppAvatar(
                    tooltip: l10n.userProfile,
                    margin: const EdgeInsets.all(16),
                    onPressed: () => UserPage.open(context),
                    child: const Icon(
                      CupertinoIcons.person,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
