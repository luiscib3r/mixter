import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<SignInBloc>();

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        final isValid = switch (state) {
          SignInFormState(isValid: final isValid) => isValid,
          _ => false,
        };

        return AutofillGroup(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.logo.image(width: 128),
              const SizedBox(height: 16),
              Text(
                l10n.signInMessage,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              AppTextField(
                padding: 16,
                placeholder: l10n.email,
                inputType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                onChanged: bloc.emailChanged,
                onSubmit: isValid ? bloc.submit : null,
              ),
              const SizedBox(height: 18),
              AppPasswordField(
                padding: 16,
                placeholder: l10n.password,
                autofillHints: const [AutofillHints.password],
                onChanged: bloc.passwordChanged,
                onSubmit: isValid ? bloc.submit : null,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () => isValid ? bloc.submit() : null,
                      text: l10n.signIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
