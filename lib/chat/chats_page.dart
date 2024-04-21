import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';

class ChatsPage extends GoRoute {
  ChatsPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: ChatsView(),
          ),
        );

  static const _path = '/chats';
  static String get route => _path;
  static void open(BuildContext context) => context.go(route);
}
