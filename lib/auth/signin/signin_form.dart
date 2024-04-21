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

    return AutofillGroup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.signInMessage,
            style: const TextStyle(fontSize: 21),
          ),
          const SizedBox(height: 32),
          AppTextField(
            padding: 16,
            placeholder: l10n.emailAddress,
            inputType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            onChanged: bloc.emailChanged,
          ),
          const SizedBox(height: 18),
          AppTextField(
            padding: 16,
            placeholder: l10n.password,
            autofillHints: const [AutofillHints.password],
            onChanged: bloc.passwordChanged,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    final isValid = switch (state) {
                      SignInFormState(isValid: final isValid) => isValid,
                      _ => false,
                    };

                    return AppButton(
                      onPressed: isValid ? bloc.submit : null,
                      text: l10n.signIn,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
