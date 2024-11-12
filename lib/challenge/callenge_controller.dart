import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  final answerIndexSelectedNotifier = ValueNotifier<int>(-1);
  int get answerIndexSelected => answerIndexSelectedNotifier.value;
  set answerIndexSelected(int value) => answerIndexSelectedNotifier.value = value;
  
  int questionAnswered = 0;
}
