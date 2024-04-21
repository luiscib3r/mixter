import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/user/user.dart';

class UserPage extends GoRoute {
  UserPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: UserView(),
          ),
        );

  static const _path = '/user';
  static String get route => _path;
  static void open(BuildContext context) => context.go(route);
}
