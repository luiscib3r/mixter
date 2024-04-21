import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter/auth/auth.dart';
import 'package:mixter/home/home.dart';
import 'package:mixter/user/user.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

GoRouter appRouterProvider(BuildContext context) {
  final bloc = context.read<SessionBloc>();
  final session = ValueNotifier(bloc.state);

  bloc.stream.listen((state) => session.value = state);

  return GoRouter(
    initialLocation: HomePage.route,
    routes: [
      HomePage(),
      SignInPage(),
      UserPage(),
    ],
    refreshListenable: session,
    redirect: (context, state) {
      final route = state.fullPath;

      if (session.value is SessionAuthenticatedState) {
        if (route == SignInPage.route || route == HomePage.route) {
          return UserPage.route;
        }
      }

      if (session.value is SessionUnauthenticatedState) {
        if (route == UserPage.route) {
          return SignInPage.route;
        }
      }

      return null;
    },
    debugLogDiagnostics: kDebugMode,
  );
}
