import 'dart:async';
import 'dart:developer';

// ignore: always_use_package_imports
import 'package:mixter/app/app.dart';
import 'package:mixter/app/webpath/webpath.dart'
    if (dart.library.html) 'package:mixter/app/webpath/webpath_web.dart';
import 'package:mixter_supabase/mixter_supabase.dart';

Future<void> bootstrap({
  required Widget Function() builder,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setWebPath();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Init environment
  const environment = AppEnvironment();

  // Init Supabase
  await setupSupabase(
    supabaseUrl: environment.supabaseUrl,
    supabaseAnonKey: environment.supabaseAnonKey,
  );

  // Run app
  runApp(
    RepositoryProvider<AppEnvironment>(
      create: (context) => environment,
      child: builder(),
    ),
  );
}
