// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:devquiz_flutter/shared/models/question_model.dart';

enum Level {
  easy,
  medium,
  hard,
  expert,
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnsered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnsered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnsered': questionAnsered,
      'image': image,
      'level': level.name,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnsered: map['questionAnsered'] as int,
      image: map['image'] as String,
      level: Level.values.firstWhere((a) => a.name == map['level'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
