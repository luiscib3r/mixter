import 'package:mixter/app/app.dart';
import 'package:mixter/user/user.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppAvatar(
      tooltip: l10n.userProfile,
      margin: const EdgeInsets.all(16),
      onPressed: () => UserPage.open(context),
      child: const Icon(
        CupertinoIcons.person,
        color: AppColors.white,
      ),
    );
  }
}
