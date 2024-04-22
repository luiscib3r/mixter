import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<SessionBloc>();

    return AppScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
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
                      const Icon(CupertinoIcons.person_circle, size: 128),
                      const SizedBox(height: 8),
                      Text(user.email),
                      const SizedBox(height: 24),
                      AppButton(
                        text: l10n.signOut,
                        onPressed: bloc.signOut,
                      ),
                    ],
                  ),
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppAvatar(
                  tooltip: l10n.chats,
                  margin: const EdgeInsets.all(16),
                  onPressed: () => ChatsPage.open(context),
                  child: const Icon(
                    CupertinoIcons.chat_bubble_2,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
