import 'package:flutter/material.dart';
import 'package:mixter_ui/mixter_ui.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    this.color = AppColors.primary,
    this.onPressed,
    this.tooltip,
    super.key,
  });

  final Color color;
  final VoidCallback? onPressed;
  final IconData icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: tooltip != null
          ? Tooltip(
              message: tooltip,
              waitDuration: const Duration(milliseconds: 600),
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
            )
          : CupertinoButton(
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
