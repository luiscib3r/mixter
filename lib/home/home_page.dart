import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/home/home.dart';

class HomePage extends GoRoute {
  HomePage()
      : super(
          path: _path,
          pageBuilder: (context, state) =>
              const CupertinoPage(child: HomeView()),
        );

  static const _path = '/';
  static String get route => _path;
  static void open(BuildContext context) => context.go(route);
}
