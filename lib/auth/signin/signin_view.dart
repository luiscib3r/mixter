import 'package:mixter/app/app.dart';
import 'package:mixter/auth/auth.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: const Center(
          child: AppCard(
            padding: 24,
            child: SizedBox(
              width: 400,
              child: SignInForm(),
            ),
          ),
        ),
      ),
    );
  }
}
