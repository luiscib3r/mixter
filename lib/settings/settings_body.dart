import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        const SizedBox(height: 64),
        Text(
          l10n.setupLlmProvider,
          style: AppTexts.title,
        ),
        const SizedBox(height: 32),
        const SizedBox(
          width: 500,
          child: LlmApiWidget(),
        ),
        const SizedBox(height: 32),
        const Expanded(
          child: SizedBox(
            width: 520,
            child: LlmApiProvidersWidget(),
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
