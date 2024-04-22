import 'package:mixter_ui/mixter_ui.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.color = AppColors.primary,
    this.padding,
    this.onPressed,
    this.suffixIcon,
    super.key,
  });

  final Color color;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final String text;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        color: color,
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(12),
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.computeLuminance() < 0.5 ? AppColors.white : null,
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              Icon(
                suffixIcon,
                color: color.computeLuminance() < 0.5 ? AppColors.white : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
