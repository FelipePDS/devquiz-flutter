import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(
    colors: [
      Color.fromARGB(255, 70, 176, 229),
      Color(0XFF7c5edd),
    ],
    stops: [
      0.0,
      0.550,
    ],
    transform: GradientRotation(2.13959913 * pi),
  );
}
