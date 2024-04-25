import 'package:flutter/material.dart';
import 'package:mixter_ui/mixter_ui.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    required this.child,
    this.onPressed,
    this.size = 32,
    this.margin = EdgeInsets.zero,
    this.color = AppColors.primary,
    this.tooltip,
    super.key,
  });

  final double size;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;
  final Color color;
  final Widget child;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        waitDuration: const Duration(milliseconds: 600),
        child: _AppWidgetButton(
          onPressed: onPressed,
          margin: margin,
          size: size,
          color: color,
          child: child,
        ),
      );
    }

    return _AppWidgetButton(
      onPressed: onPressed,
      margin: margin,
      size: size,
      color: color,
      child: child,
    );
  }
}

class _AppWidgetButton extends StatelessWidget {
  const _AppWidgetButton({
    required this.onPressed,
    required this.margin,
    required this.size,
    required this.color,
    required this.child,
  });

  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;
  final double size;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppWidgetButton(
      onPressed: onPressed,
      child: Container(
        margin: margin,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
