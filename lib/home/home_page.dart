import 'package:devquiz_flutter/challenge/challenge_page.dart';
import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/home/home_controller.dart';
import 'package:devquiz_flutter/home/home_state.dart';
import 'package:devquiz_flutter/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/appbar/app_bar_widget.dart';
import 'widgets/level_button/level_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizList();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.success) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              AppColors.darkGreen,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBarWidget(
        user: controller.user!,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil",
                ),
                LevelButtonWidget(
                  label: "Médio",
                ),
                LevelButtonWidget(
                  label: "Difícil",
                ),
                LevelButtonWidget(
                  label: "Perito",
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizList!
                    .map(
                      (quiz) => QuizCardWidget(
                        title: quiz.title,
                        completed:
                            "${quiz.questionAnswered} de ${quiz.questions.length}",
                        percentage:
                            quiz.questionAnswered / quiz.questions.length,
                        image: quiz.image,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChallengePage(
                                quiz: quiz,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
