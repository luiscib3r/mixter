import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chats_page.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChatAppBarLeading(),
        Text('Chat Title'),
        ChatAppBarTrail(),
      ],
    );
  }
}

class ChatAppBarLeading extends StatelessWidget {
  const ChatAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 12),
        AppWidgetButton(
          onPressed: () => ChatsPage.open(context),
          child: Assets.images.logo.image(width: 64),
        ),
      ],
    );
  }
}

class ChatAppBarTrail extends StatelessWidget {
  const ChatAppBarTrail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsButton(),
        SizedBox(width: 12),
        UserProfileButton(),
        SizedBox(width: 12),
      ],
    );
  }
}
