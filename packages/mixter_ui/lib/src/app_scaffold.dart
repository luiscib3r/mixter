import 'package:mixter_ui/mixter_ui.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: child,
    );
  }
}
