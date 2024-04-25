import 'package:mixter/app/app.dart';
import 'package:mixter/chat/chat.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listenWhen: (prev, curr) => curr is ChatDeleted,
      listener: (context, state) => ChatsPage.open(context),
      builder: (context, state) {
        return switch (state) {
          ChatLoading() => const Center(child: AppLoading()),
          ChatFailure(failure: final failure) =>
            ChatBodyFailure(failure: failure),
          ChatData(messages: final messages) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length + (state.isGenerating ? 1 : 0),
                    itemBuilder: (context, index) {
                      ChatMessage getMessage() {
                        if (state.isGenerating) {
                          if (index == 0) {
                            return ChatMessage(
                              id: 'generating',
                              content: state.generatingMessage!,
                              role: UserRole.assistant,
                              chatConversationId: state.conversation.id,
                              userId: state.conversation.userId,
                              createdAt: DateTime.now(),
                            );
                          } else {
                            return messages[index - 1];
                          }
                        } else {
                          return messages[index];
                        }
                      }

                      final message = getMessage();

                      return ChatMessageTile(
                        key: ValueKey(message.id),
                        message: message,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 96),
              ],
            ),
          ChatDeleted() => const SizedBox.shrink(),
        };
      },
    );
  }
}

class ChatBodyFailure extends StatelessWidget {
  const ChatBodyFailure({
    required this.failure,
    super.key,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            context.failureMessage(failure),
          ),
          const SizedBox(height: 16),
          AppButton(
            onPressed: () {},
            text: l10n.reload,
          ),
        ],
      ),
    );
  }
}
