import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/auth/auth.dart';

class SignInPage extends GoRoute {
  SignInPage()
      : super(
          path: _path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: SignInView(),
          ),
        );

  static const _path = '/auth/signin';
  static String get route => _path;
  static void open(BuildContext context) => context.go(route);
}
