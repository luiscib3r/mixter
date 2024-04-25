import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class ChatMessageTile extends StatelessWidget {
  const ChatMessageTile({
    required this.message,
    super.key,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    const maxWidth = 664.0;
    final width = context.width < maxWidth ? context.width : maxWidth;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: width,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: message.role == UserRole.user
                    ? AppColors.card
                    : AppColors.cardBorder,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.cardBorder,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (message.role == UserRole.user) ...[
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            CupertinoIcons.person,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          child: MarkdownBody(
                            selectable: true,
                            data: message.content,
                            onTapText: () {},
                            onSelectionChanged: (
                              String? text,
                              TextSelection selection,
                              SelectionChangedCause? cause,
                            ) {},
                            styleSheet: MarkdownStyleSheet(
                              p: CupertinoTheme.of(context).textTheme.textStyle,
                              listBullet: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle,
                              code: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle,
                              codeblockDecoration: BoxDecoration(
                                color: AppColors.codeBackground,
                                border: const Border(
                                  left: BorderSide(
                                    color: AppColors.cardBorder,
                                    width: 4,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              codeblockPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (message.role == UserRole.assistant)
                    ChatToolsWidget(message: message),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChatToolsWidget extends StatefulWidget {
  const ChatToolsWidget({
    required this.message,
    super.key,
  });

  final ChatMessage message;

  @override
  State<ChatToolsWidget> createState() => _ChatToolsWidgetState();
}

class _ChatToolsWidgetState extends State<ChatToolsWidget> {
  IconData _clipboardIcon = Ionicons.clipboard_outline;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppWidgetButton(
          onPressed: () {
            Clipboard.setData(
              ClipboardData(text: widget.message.content),
            );
            setState(() {
              _clipboardIcon = Ionicons.checkmark_done;
            });

            Future<void>.delayed(const Duration(seconds: 2), () {
              setState(() {
                _clipboardIcon = Ionicons.clipboard_outline;
              });
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.toolsColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.cardBorder,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _clipboardIcon,
                  size: 16,
                  color: AppColors.toolsText,
                ),
                const SizedBox(width: 4),
                Text(
                  l10n.copy,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.toolsText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
