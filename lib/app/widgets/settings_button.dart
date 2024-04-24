import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppIconButton(
      tooltip: l10n.settings,
      icon: CupertinoIcons.settings,
      onPressed: () => SettingsPage.open(context),
    );
  }
}
