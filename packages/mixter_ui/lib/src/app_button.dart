import 'package:mixter_ui/mixter_ui.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.color = AppColors.primary,
    this.onPressed,
    super.key,
  });

  final Color color;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        color: color,
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color.computeLuminance() < 0.5 ? AppColors.white : null,
          ),
        ),
      ),
    );
  }
}
