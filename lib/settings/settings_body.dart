import 'package:mixter/app/app.dart';
import 'package:mixter/settings/settings.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final width = context.width * 0.8;

    return Column(
      children: [
        const SizedBox(height: 64),
        Text(
          l10n.setupLlmProvider,
          style: AppTexts.title,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: width,
          child: const LlmApiWidget(),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: SizedBox(
            width: width,
            child: const LlmApiSelector(),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
