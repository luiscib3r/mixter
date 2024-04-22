import 'package:go_router/go_router.dart';
import 'package:mixter/app/app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: authRepositoryProvider),
        RepositoryProvider(create: llmApiRepositoryProvider),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: sessionBlocProvider),
          RepositoryProvider(create: llmApiBlocProvider),
        ],
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
