import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestIndcatorWidget extends StatelessWidget {
  final int questionsLength;
  final int currentQuestion;

  const QuestIndcatorWidget({
    super.key,
    required this.questionsLength,
    required this.currentQuestion,
  });

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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BackButton(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "Questão $currentQuestion de $questionsLength",
                  style: AppTextStyles.body,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          ProgressIndicatorWidget(
            value: currentQuestion / questionsLength,
          ),
        ],
      ),
    );
  }
}
