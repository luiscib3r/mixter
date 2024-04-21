import 'package:mixter_ui/mixter_ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.borderRadius = 12,
    this.padding = 16,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
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
