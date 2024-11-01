import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: const CircularProgressIndicator(
                strokeWidth: 10,
                value: .75,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.chartPrimary,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "75%",
              style: AppTextStyles.heading,
            ),
          ),
        ],
      ),
    );
  }
}
