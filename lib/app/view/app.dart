import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: authRepositoryProvider,
      child: BlocProvider(
        create: sessionBlocProvider,
        child: RepositoryProvider(
          create: appRouterProvider,
          child: Builder(
            builder: (context) {
              return MixterApp(
                router: context.read<GoRouter>(),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
              );
            },
          ),
        ),
      ),
    );
  }
}
