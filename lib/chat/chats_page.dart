import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter/settings/settings_page.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

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
  static void open(BuildContext context) {
    final llmApiState = context.read<LlmApiBloc>().state;

    if (llmApiState is LlmApiData && llmApiState.llmApi != null) {
      context.go(route);
    } else {
      SettingsPage.open(context);
    }
  }
}
