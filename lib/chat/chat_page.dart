import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter/settings/settings.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatPage extends GoRoute {
  ChatPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => CupertinoPage(
            child: RepositoryProvider(
              create: chatRepositoryProvider,
              child: BlocProvider(
                create: (context) => chatBlocProvider(context)
                  ..load(state.pathParameters['chatId']!),
                child: const ChatView(),
              ),
            ),
          ),
        );

  static const _path = '/chat/:chatId';

  static String route({
    required String chatId,
  }) =>
      '/chat/$chatId';

  static void open(
    BuildContext context, {
    required String chatId,
  }) {
    final llmApiState = context.read<LlmApiBloc>().state;

    if (llmApiState is LlmApiData && llmApiState.llmApi != null) {
      context.go(route(chatId: chatId));
    } else {
      SettingsPage.open(context);
    }
  }
}
