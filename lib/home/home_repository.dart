import 'dart:convert';

import 'package:devquiz_flutter/shared/models/quiz_model.dart';
import 'package:devquiz_flutter/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizList() async {
    final response = await rootBundle.loadString("assets/database/quiz.json");
    final responseAsList = jsonDecode(response) as List;
    final quizList = responseAsList.map((e) => QuizModel.fromMap(e)).toList();

    return quizList;
  }
}
