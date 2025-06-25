import 'package:flutter/material.dart';

class AppColors {
  static const Color gradientStart = Color(0xFFe0eafc);
  static const Color gradientEnd = Color(0xFFcfdef3);
  static const Color detailsGradientStart = Color(0xFFe0eafc);
  static const Color detailsGradientEnd = Color(0xFFcfdef3);
  static const int outlineAlpha = 77; // 0.3 * 255 ≈ 77
  static const Color imagePlaceholderBackground =
      Color(0xFFF5F5F5); // grey[200]
  static const Color imagePlaceholderIcon = Color(0xFFBDBDBD); // grey
}

const List<Color> kLandingGradientColors = <Color>[
  AppColors.gradientStart,
  AppColors.gradientEnd,
];

const List<Color> kDetailsGradientColors = <Color>[
  AppColors.detailsGradientStart,
  AppColors.detailsGradientEnd,
];
