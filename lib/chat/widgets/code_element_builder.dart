import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
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
                child: view,
              ),
            ],
          );
  }
}
