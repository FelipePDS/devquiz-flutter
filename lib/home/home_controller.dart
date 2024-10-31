import 'package:devquiz_flutter/home/home_repository.dart';
import 'package:devquiz_flutter/home/home_state.dart';
import 'package:devquiz_flutter/shared/models/quiz_model.dart';
import 'package:devquiz_flutter/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizList;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();
    
    state = HomeState.success;
  }

  void getQuizList() async {
    state = HomeState.loading;

    quizList = await repository.getQuizList();
    
    state = HomeState.success;
  }
}
