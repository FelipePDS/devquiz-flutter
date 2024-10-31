import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  
  const ProgressIndicatorWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: const AlwaysStoppedAnimation(
        AppColors.chartPrimary,
      ),
    );
  }
}
