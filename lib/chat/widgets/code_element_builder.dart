import 'package:flutter/services.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mixter/app/app.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      final lg = element.attributes['class']!;
      language = lg.substring(9);
    }

    final view = HighlightView(
      // The original code to be highlighted
      element.textContent,

      // Specify language
      // It is recommended to give it a value for performance
      language: language,

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: atomOneDarkTheme,
      // Specify padding
      padding: const EdgeInsets.all(8),

      // Specify text style
      textStyle: GoogleFonts.firaCode(),
    );

    return element.attributes.isEmpty
        ? view
        : Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CodeToolsWidget(code: element.textContent),
                    Row(
                      children: [
                        Expanded(child: view),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class CodeToolsWidget extends StatefulWidget {
  const CodeToolsWidget({
    required this.code,
    super.key,
  });

  final String code;

  @override
  State<CodeToolsWidget> createState() => _CodeToolsWidgetState();
}

class _CodeToolsWidgetState extends State<CodeToolsWidget> {
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
              ClipboardData(text: widget.code),
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
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(4),
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
