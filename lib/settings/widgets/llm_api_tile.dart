import 'package:mixter/app/app.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LlmApiTile extends StatelessWidget {
  const LlmApiTile({
    required this.icon,
    required this.name,
    required this.description,
    this.url,
    this.suffixAction,
    super.key,
  }) : assert(
          url == null || suffixAction == null,
          'Only one of url or suffixAction can be provided',
        );

  final Widget icon;
  final String name;
  final String description;
  final String? url;
  final VoidCallback? suffixAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: icon,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (url != null)
            AppIconButton(
              icon: CupertinoIcons.link,
              onPressed: () => launchUrlString(url!),
            ),
          if (suffixAction != null)
            AppIconButton(
              icon: CupertinoIcons.arrow_clockwise,
              onPressed: suffixAction,
            ),
        ],
      ),
    );
  }
}
