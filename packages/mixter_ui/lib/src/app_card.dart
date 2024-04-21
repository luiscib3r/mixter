import 'package:mixter_ui/mixter_ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.borderRadius = 12,
    this.padding = 16,
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final double padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors.card,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
