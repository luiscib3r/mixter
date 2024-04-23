import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';

class ChatPage extends GoRoute {
  ChatPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: ChatView(),
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
    context.go(route(chatId: chatId));
  }
}
