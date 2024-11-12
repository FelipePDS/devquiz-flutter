// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double score;

  const ScoreCardWidget({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Cor da sombra
            spreadRadius: 1, // Espalhamento da sombra
            blurRadius: 2, // Desfoque da sombra
            offset: const Offset(0, 1), // Deslocamento horizontal e vertical
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ChartWidget(score: score),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vamos começar",
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Complete os desafios e avance em conhecimento",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
