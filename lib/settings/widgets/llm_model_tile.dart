import 'package:intl/intl.dart';
import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

class LlmModelTile extends StatelessWidget {
  const LlmModelTile({
    required this.model,
    required this.icon,
    super.key,
  });

  final LlmModel model;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('en_US');

    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: icon,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      model.id,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 12),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         model.description,
          //         overflow: TextOverflow.clip,
          //         maxLines: 2,
          //         style: const TextStyle(
          //           color: AppColors.white,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${formatter.format(model.contextWindow)} tokens'),
            ],
          ),
        ],
      ),
    );
  }
}
