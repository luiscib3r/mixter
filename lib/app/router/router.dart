import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mixter/auth/auth.dart';
import 'package:mixter/home/home.dart';
import 'package:mixter/user/user.dart';

final appRouter = GoRouter(
  initialLocation: HomePage.route,
  routes: [
    HomePage(),
    SignInPage(),
    UserPage(),
  ],
  debugLogDiagnostics: kDebugMode,
);
