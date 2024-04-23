import 'package:ionicons/ionicons.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatInitialInput extends StatefulWidget {
  const ChatInitialInput({
    super.key,
  });

  @override
  State<ChatInitialInput> createState() => _ChatInitialInputState();
}

class _ChatInitialInputState extends State<ChatInitialInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<ChatsBloc>();

    return AppTextField(
      controller: controller,
      padding: 18,
      fontSize: 21,
      placeholder: l10n.askAnything,
      alwaysShowSuffix: true,
      onSubmit: () {
        if (controller.text.isNotEmpty) {
          bloc.createConversation(controller.text);
        }
      },
      suffix: Container(
        margin: const EdgeInsets.only(right: 8),
        child: AppButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              bloc.createConversation(controller.text);
            }
          },
          padding: const EdgeInsets.symmetric(horizontal: 16),
          text: l10n.startChat,
          suffixIcon: Ionicons.send,
        ),
      ),
    );
  }
}
