import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatsBloc, ChatsState>(
      listenWhen: (prev, curr) => curr is ChatsData && curr.chatId != null,
      listener: (context, state) => ChatPage.open(
        context,
        chatId: (state as ChatsData).chatId!,
      ),
      child: const AppScaffold(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ChatsBody(),
            Align(
              alignment: Alignment.topRight,
              child: ChatAppBarTrail(),
            ),
          ],
        ),
      ),
    );
  }
}
