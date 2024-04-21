import 'package:mixter/app/app.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () {},
                  text: l10n.continueWithEmail,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
