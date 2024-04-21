import 'package:mixter_ui/mixter_ui.dart';

enum AppDialogType {
  info,
  warning,
  error,
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    required this.content,
    this.type = AppDialogType.info,
    this.actions = const [],
    super.key,
  });

  final String title;
  final Widget content;
  final AppDialogType type;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppCard(
        width: context.width * 0.25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                switch (type) {
                  AppDialogType.info => const Icon(CupertinoIcons.info),
                  AppDialogType.warning =>
                    const Icon(CupertinoIcons.exclamationmark_triangle),
                  AppDialogType.error =>
                    const Icon(CupertinoIcons.xmark_circle),
                },
                const SizedBox(width: 12),
                Text(title),
                const Spacer(),
                AppIconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: CupertinoIcons.xmark_circle,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(8),
              child: content,
            ),
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    AppDialogType type = AppDialogType.info,
  }) =>
      showCupertinoDialog<T>(
        context: context,
        builder: (context) => AppDialog(
          title: title,
          content: content,
          type: type,
        ),
      );
}
