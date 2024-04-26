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
    this.obscureText = false,
    this.inputType,
    this.onChanged,
    this.suffix,
    this.suffixMode,
    this.alwaysShowSuffix = false,
    this.onSubmit,
    this.value,
    this.decoration,
    this.controller,
    this.focus,
  });

  final bool enabled;
  final String? placeholder;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final TextInputType? inputType;
  final Iterable<String> autofillHints;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final Widget? suffix;
  final bool alwaysShowSuffix;
  final OverlayVisibilityMode? suffixMode;
  final VoidCallback? onSubmit;
  final String? value;
  final BoxDecoration? decoration;
  final TextEditingController? controller;
  final FocusNode? focus;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  Color borderColor = AppColors.textFieldBorder;
  late final focus = widget.focus ?? FocusNode();
  late final controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      controller.text = widget.value!;
    }

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
  void dispose() {
    focus.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      focusNode: focus,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      onSubmitted: (_) => widget.onSubmit?.call(),
      keyboardType: widget.inputType,
      padding: EdgeInsets.all(widget.padding),
      decoration: widget.decoration ??
          BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: AppColors.textField,
          ),
      placeholder: widget.placeholder,
      style: TextStyle(fontSize: widget.fontSize),
      suffixMode: widget.suffixMode ?? OverlayVisibilityMode.always,
      suffix: focus.hasFocus || widget.alwaysShowSuffix ? widget.suffix : null,
    );
  }
}
