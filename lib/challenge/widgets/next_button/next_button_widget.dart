import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color buttonOverlayColor;
  final double? width;
  final VoidCallback onTap;

  const NextButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.buttonOverlayColor,
    required this.onTap,
    this.width,
  });

  const NextButtonWidget.success({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.darkGreen,
        fontColor = AppColors.white,
        borderColor = AppColors.darkGreen,
        buttonOverlayColor = AppColors.buttonOverlayColor,
        width = null;

  const NextButtonWidget.ghost({
    super.key,
    required this.label,
    required this.onTap,
    hasBorder = false,
    double width = 0,
  })  : backgroundColor = AppColors.white,
        fontColor = AppColors.grey,
        borderColor = hasBorder ? AppColors.border : AppColors.white,
        buttonOverlayColor = AppColors.buttonOverlayColor,
        width = width > 0 ? width : double.maxFinite;

  const NextButtonWidget.purple({
    super.key,
    required this.label,
    required this.onTap,
    double width = 0,
  })  : backgroundColor = AppColors.purple,
        fontColor = AppColors.white,
        borderColor = AppColors.purple,
        buttonOverlayColor = AppColors.buttonOverlayColor,
        width = width > 0 ? width : double.maxFinite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: borderColor),
          ),
          overlayColor: WidgetStatePropertyAll(
            buttonOverlayColor,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
