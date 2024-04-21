import 'package:mixter_ui/mixter_ui.dart';

class MixterApp extends StatelessWidget {
  const MixterApp({
    required this.router,
    required this.supportedLocales,
    required this.localizationsDelegates,
    super.key,
  });

  final RouterConfig<Object> router;

  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      theme: appTheme,
      routerConfig: router,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
