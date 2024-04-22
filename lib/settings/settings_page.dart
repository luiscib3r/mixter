import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';

class SettingsPage extends GoRoute {
  SettingsPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: BlocProvider(
              create: settingsBlocProvider,
              child: SettingsView(),
            ),
          ),
        );

  static const _path = '/settings';
  static String get route => _path;
  static void open(BuildContext context) => context.go(_path);
}
