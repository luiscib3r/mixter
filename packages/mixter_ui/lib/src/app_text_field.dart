import 'package:mixter_ui/mixter_ui.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.placeholder,
    this.enabled = true,
    this.borderRadius = 12,
    this.padding = 12,
    this.fontSize = 18,
    this.autofillHints = const [],
    this.inputType,
    this.onChanged,
  });

  final bool enabled;
  final String? placeholder;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final TextInputType? inputType;
  final Iterable<String> autofillHints;
  final ValueChanged<String>? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final focus = FocusNode();
  Color borderColor = AppColors.textFieldBorder;

  @override
  void initState() {
    super.initState();

    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          borderColor = AppColors.primary;
        });
      } else {
        setState(() {
          borderColor = AppColors.textFieldBorder;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: focus,
      enabled: widget.enabled,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      keyboardType: widget.inputType,
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: AppColors.textField,
      ),
      placeholder: widget.placeholder,
      style: TextStyle(fontSize: widget.fontSize),
    );
  }
}
