import 'package:mixter_ui/mixter_ui.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.placeholder,
    this.enabled = true,
    this.borderRadius = 12,
    this.padding = 12,
    this.fontSize = 18,
    this.autofillHints = const [],
    this.inputType,
    this.onChanged,
    this.onSubmit,
  });

  final bool enabled;
  final String? placeholder;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final TextInputType? inputType;
  final Iterable<String> autofillHints;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmit;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      enabled: widget.enabled,
      borderRadius: widget.borderRadius,
      padding: widget.padding,
      fontSize: widget.fontSize,
      autofillHints: widget.autofillHints,
      placeholder: widget.placeholder,
      inputType: widget.inputType,
      onChanged: widget.onChanged,
      obscureText: obscureText,
      onSubmit: widget.onSubmit,
      suffix: Padding(
        padding: const EdgeInsets.all(8),
        child: AppIconButton(
          icon: obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
