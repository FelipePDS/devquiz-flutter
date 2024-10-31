import 'package:devquiz_flutter/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          const SizedBox(
            height: 24,
          ),
          const AnswerWidget(
            isSelected: true,
            isRight: true,
            title:
                "Possibilita a criação de aplicativos compilados nativamente",
          ),
          const AnswerWidget(
            title:
                "Possibilita a criação de aplicativos compilados nativamente",
          ),
          const AnswerWidget(
            title:
                "Possibilita a criação de aplicativos compilados nativamente",
          ),
          const AnswerWidget(
            title:
                "Possibilita a criação de aplicativos compilados nativamente",
          ),
        ],
      ),
    );
  }
}
