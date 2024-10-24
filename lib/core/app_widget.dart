import 'package:devquiz_flutter/home/home_page.dart';
import 'package:devquiz_flutter/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
