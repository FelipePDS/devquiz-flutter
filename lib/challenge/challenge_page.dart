import 'package:devquiz_flutter/challenge/callenge_controller.dart';
import 'package:devquiz_flutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz_flutter/challenge/widgets/quest_indicator/quest_indcator_widget.dart';
import 'package:devquiz_flutter/challenge/widgets/question_answer_status/question_answer_status_widget.dart';
import 'package:devquiz_flutter/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/result/result_page.dart';
import 'package:devquiz_flutter/shared/models/answer_model.dart';
import 'package:devquiz_flutter/shared/models/quiz_model.dart';
import 'package:devquiz_flutter/shared/widgets/full_screen_overlay/full_screen_overlay.dart';
import 'package:devquiz_flutter/shared/widgets/toast_notification/toast_notification.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({
    super.key,
    required this.quiz,
  });

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  AnswerModel answerCurrentQuestion(
    int currentQuestion,
    int answerIndexSelected,
  ) =>
      (widget.quiz.questions[currentQuestion].answers[answerIndexSelected]);

  AnswerModel answerCurrentQuestionRight(
    int currentQuestion,
  ) =>
      (widget.quiz.questions[currentQuestion].answers
          .firstWhere((a) => a.isRight == true));

  VoidCallback? nextQuestion() {
    bool questionIsLast =
        widget.quiz.questions.length == controller.currentQuestion;

    if (questionIsLast) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              quizTitle: widget.quiz.title,
              questionAnswered: controller.questionAnswered,
              totalQuestions: widget.quiz.questions.length,
            ),
          ),
        );
      });

      return null;
    }

    controller.answerIndexSelected = -1;

    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );

    return null;
  }

  @override
  void initState() {
    controller.currentQuestionNotifier.addListener(() {
      setState(() {});
    });

    controller.answerIndexSelectedNotifier.addListener(() {
      setState(() {});
    });

    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          top: true,
          child: ValueListenableBuilder(
            valueListenable: controller.currentQuestionNotifier,
            builder: (context, value, _) => QuestIndcatorWidget(
              currentQuestion: value,
              questionsLength: widget.quiz.questions.length,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.quiz.questions
            .map(
              (quest) => QuizWidget(
                question: quest,
                challengeController: controller,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: NextButtonWidget.ghost(
                label: "Pular",
                onTap: nextQuestion,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.answerIndexSelectedNotifier,
                builder: (context, value, _) => NextButtonWidget.success(
                  label: "Confirmar",
                  onTap: () {
                    if (controller.answerIndexSelected == -1) {
                      Fluttertoast.cancel();
                      showToast("Selecione uma alternativa :)");
                      return;
                    }

                    var selectedAnswer = answerCurrentQuestion(
                      controller.currentQuestion - 1,
                      controller.answerIndexSelected,
                    );
                    bool answerCurrentQuestionIsRight =
                        selectedAnswer.isRight == true;

                    var answerRight = answerCurrentQuestionRight(
                      controller.currentQuestion - 1,
                    );

                    if (answerCurrentQuestionIsRight) {
                      controller.questionAnswered += 1;
                    }

                    showFullScreenOverlay(
                      context,
                      QuestionAnswerStatusWidget(
                        isRight: answerCurrentQuestionIsRight,
                        onClose: nextQuestion,
                        answerRightText: answerRight.title,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
