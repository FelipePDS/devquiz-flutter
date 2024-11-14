import 'package:devquiz_flutter/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double value;

  const ProgressIndicatorWidget({
    super.key,
    required this.value,
  });

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _animation =
        Tween<double>(begin: 0.0, end: widget.value).animate(_controller);

    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) => LinearProgressIndicator(
        value: widget.value,
        backgroundColor: AppColors.chartSecondary,
        valueColor: const AlwaysStoppedAnimation(
          AppColors.chartPrimary,
        ),
      ),
    );
  }
}
