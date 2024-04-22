import 'package:mixter_ui/mixter_ui.dart';

class AppWidgetButton extends StatelessWidget {
  const AppWidgetButton({
    required this.child,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        onPressed: onPressed,
        minSize: 0,
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
