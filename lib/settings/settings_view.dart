import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<LlmApiBloc, LlmApiState>(
      listenWhen: (prev, curr) =>
          (prev is! LlmApiData && curr is LlmApiData && curr.llmApi != null) ||
          (prev is LlmApiData &&
              curr is LlmApiData &&
              prev.llmApi != curr.llmApi),
      listener: (context, state) {
        ChatsPage.open(context);
      },
      child: AppScaffold(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const SettingsBody(),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppAvatar(
                    tooltip: l10n.chats,
                    margin: const EdgeInsets.all(16),
                    onPressed: () => ChatsPage.open(context),
                    child: const Icon(
                      CupertinoIcons.chat_bubble_2,
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
