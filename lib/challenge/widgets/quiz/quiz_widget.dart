import 'package:devquiz_flutter/challenge/callenge_controller.dart';
import 'package:devquiz_flutter/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/shared/models/answer_model.dart';
import 'package:devquiz_flutter/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ChallengeController challengeController;

  const QuizWidget({
    super.key,
    required this.question,
    required this.challengeController,
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          const SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              isSelected: widget.challengeController.answerIndexSelected == i,
              title: answer(i).title,
              ontTap: () {
                widget.challengeController.answerIndexSelected = i;
                setState(() {});
              },
            )
        ],
      ),
    );
  }
}
