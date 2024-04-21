import 'package:mixter/app/app.dart';
import 'package:mixter/auth/auth.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignInBloc>();

    return AppScaffold(
      child: BlocConsumer<SignInBloc, SignInState>(
        listenWhen: (previous, current) => current is SignInFailureState,
        listener: (context, state) {
          if (state is SignInFailureState) {
            context.showFailure(state.failure).then((value) => bloc.reset());
          }
        },
        builder: (context, state) {
          if (state is SignInFailureState) {
            return const SizedBox.shrink();
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              const Center(
                child: SizedBox(
                  width: 400,
                  child: SignInForm(),
                ),
              ),
              if (state is SignInLoadingState)
                ColoredBox(
                  color: AppColors.shadow.withOpacity(0.5),
                  child: const Center(child: AppLoading()),
                ),
            ],
          );
        },
      ),
    );
  }
}
