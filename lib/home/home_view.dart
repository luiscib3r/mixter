import 'package:mixter/app/app.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScaffold(
      child: Center(
        child: Text(l10n.appName),
      ),
    );
  }
}
