import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mixter/home/home.dart';

final appRouter = GoRouter(
  initialLocation: HomePage.route,
  routes: [
    HomePage(),
  ],
  debugLogDiagnostics: kDebugMode,
);
