import 'package:ionicons/ionicons.dart';
import 'package:mixter/app/app.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.logo.image(width: 32),
                  const SizedBox(width: 8),
                  Text(
                    l10n.appName,
                    style: AppTexts.title,
                  ),
                ],
              ),
              const SizedBox(height: 72),
              Text(
                l10n.welcomeMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: context.width * 0.6,
                child: AppTextField(
                  padding: 18,
                  fontSize: 21,
                  placeholder: l10n.askAnything,
                  alwaysShowSuffix: true,
                  onSubmit: () {},
                  suffix: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: AppButton(
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      text: l10n.startChat,
                      suffixIcon: Ionicons.send,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
