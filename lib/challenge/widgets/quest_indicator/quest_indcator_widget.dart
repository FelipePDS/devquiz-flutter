import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestIndcatorWidget extends StatelessWidget {
  const QuestIndcatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão 04",
                style: AppTextStyles.body,
              ),
              Text(
                "de 10",
                style: AppTextStyles.body,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const ProgressIndicatorWidget(
            value: 0.4,
          ),
        ],
      ),
    );
  }
}
