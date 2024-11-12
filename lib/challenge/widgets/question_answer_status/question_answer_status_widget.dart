import 'package:devquiz_flutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuestionAnswerStatusWidget extends StatelessWidget {
  final bool isRight;
  final VoidCallback onClose;
  final String answerRightText;

  const QuestionAnswerStatusWidget({
    super.key,
    required this.isRight,
    required this.onClose,
    required this.answerRightText,
  });

  String get _image => isRight ? "check.png" : "error.png";
  String get _statusMessage => isRight ? "Acertou!" : "Errou :/";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset("assets/images/$_image"),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(_statusMessage, style: AppTextStyles.heading30),
          const SizedBox(
            height: 16,
          ),
          Text(
            answerRightText,
            style: AppTextStyles.body16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 56,
          ),
          NextButtonWidget.purple(
            label: "Avançar",
            width: 200,
            onTap: () {
              onClose();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
