import 'package:mixter_ui/mixter_ui.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    this.color = AppColors.primary,
    this.onPressed,
    super.key,
  });

  final Color color;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
