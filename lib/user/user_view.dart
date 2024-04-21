import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SessionBloc>();

    return AppScaffold(
      child: Center(
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) => switch (state) {
            // Loading
            SessionLoadingState() => const AppLoading(),
            // Failure
            SessionFailureState(failure: final failure) => Center(
                child: Text(failure.toString()),
              ),
            // Unauthenticated
            SessionUnauthenticatedState() => const Center(
                child: Text('Unauthenticated'),
              ),
            // Authenticated
            SessionAuthenticatedState(user: final user) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user.id),
                  const SizedBox(height: 8),
                  Text(user.email),
                  const SizedBox(height: 8),
                  AppButton(
                    text: 'Sign Out',
                    onPressed: bloc.signOut,
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
