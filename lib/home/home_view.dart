import 'dart:developer';

import 'package:mixter/app/app.dart';
import 'package:mixter/auth/auth.dart';
import 'package:mixter/user/user.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        switch (state) {
          case SessionAuthenticatedState():
            UserPage.open(context);
          case SessionUnauthenticatedState():
            SignInPage.open(context);
          case SessionFailureState(failure: final failure):
            log(failure.toString());
          default:
        }
      },
      child: AppScaffold(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.appName),
              const SizedBox(height: 12),
              const AppLoading(),
            ],
          ),
        ),
      ),
    );
  }
}
