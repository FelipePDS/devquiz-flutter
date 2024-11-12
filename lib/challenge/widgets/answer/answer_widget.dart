import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isSelected;

  final VoidCallback ontTap;

  const AnswerWidget({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.ontTap,
  });

  Color get _selectBorderColor =>
      isSelected ? AppColors.lightGreen : AppColors.border;
      
  Color get _selectBackgroundColor =>
      isSelected ? AppColors.darkGreen : AppColors.white;

  Color get _cardBackgroundColor =>
      isSelected ? AppColors.lightGreen : AppColors.white;

  Color get _cardBorderColor =>
      isSelected ? AppColors.green : AppColors.border;

  TextStyle get _cardTextStyle =>
      isSelected ? AppTextStyles.bodyDarkGreen : AppTextStyles.body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: _cardBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: _cardBorderColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style:
                      _cardTextStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: _selectBackgroundColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: _selectBorderColor,
                    ),
                  ),
                ),
                width: 24,
                height: 24,
                child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 16,
                        )
                      : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
