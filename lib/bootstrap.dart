import 'dart:async';
import 'dart:developer';

// ignore: always_use_package_imports
import 'package:mixter/app/app.dart';
import 'package:mixter/app/webpath/webpath.dart'
    if (dart.library.html) 'package:mixter/app/webpath/webpath_web.dart';

Future<void> bootstrap({
  required String env,
  required Widget Function() builder,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setWebPath();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(
    RepositoryProvider<AppEnvironment>(
      create: (context) => AppEnvironment(env: env),
      child: builder(),
    ),
  );
}
