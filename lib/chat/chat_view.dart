import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_ui/mixter_ui.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    const maxWidth = 690.0;
    final width = context.width < maxWidth ? context.width : maxWidth;

    return AppScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const ChatBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: width,
              child: const ChatMessageInput(),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: ChatAppBar(),
          ),
        ],
      ),
    );
  }
}
