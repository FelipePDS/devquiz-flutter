import 'package:devquiz_flutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String quizTitle;
  final int totalQuestions;
  final int questionAnswered;

  const ResultPage({
    super.key,
    required this.quizTitle,
    required this.totalQuestions,
    required this.questionAnswered,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 68,
        ),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset("assets/images/trophy.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            const SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                text: "Você concluiu\n",
                style: AppTextStyles.body16,
                children: [
                  TextSpan(
                    text: "$quizTitle\n",
                    style: AppTextStyles.body16Bold,
                  ),
                  TextSpan(
                    text: "com $questionAnswered de $totalQuestions acertos",
                    style: AppTextStyles.body16,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 80,
            ),
            NextButtonWidget.purple(
              label: "Compartilhar",
              onTap: () {
                Share.share(
                  "DevQuiz NLW 5 - Flutter: Resultado do Quiz: $quizTitle\n Obtive: ${questionAnswered / totalQuestions}% de aproveitamento!",
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            NextButtonWidget.ghost(
              label: "Voltar ao início",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
