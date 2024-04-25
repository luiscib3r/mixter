import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const maxWidth = 682.0;
    final width = context.width < maxWidth ? context.width : maxWidth;

    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.logo.image(width: 32),
                  const SizedBox(width: 8),
                  Text(
                    l10n.appName,
                    style: AppTexts.title,
                  ),
                ],
              ),
              const SizedBox(height: 72),
              Text(
                l10n.welcomeMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: width,
                child: const ChatInitialInput(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: width,
                child: BlocBuilder<ChatsBloc, ChatsState>(
                  builder: (context, state) => switch (state) {
                    ChatsLoading() => const Center(
                        child: AppLoading(),
                      ),
                    ChatsData(chats: final chats) => Column(
                        children:
                            chats.map((chat) => ChatTitle(chat: chat)).toList(),
                      ),
                    ChatsFailure(failure: final failure) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.exclamationmark_triangle,
                              size: 48,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              context.failureMessage(failure),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
