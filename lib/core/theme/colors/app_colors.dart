import 'package:flutter/material.dart';

import 'color_scale.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color background;

  final Color textPrimary;
  final Color textSecondary;

  final Color white;

  final ColorScale neutral;
  final ColorScale red;
  final ColorScale amber;
  final ColorScale green;
  final ColorScale blue;
  final ColorScale zinc;

  const AppColors({
    required this.background,
    required this.textPrimary,
    required this.textSecondary,
    required this.white,
    required this.neutral,
    required this.red,
    required this.amber,
    required this.green,
    required this.blue,
    required this.zinc,
  });

  @override
  AppColors copyWith({
    Color? background,
    Color? textPrimary,
    Color? textSecondary,
    Color? white,
    ColorScale? neutral,
    ColorScale? red,
    ColorScale? amber,
    ColorScale? green,
    ColorScale? blue,
    ColorScale? zinc,
  }) {
    return AppColors(
      background: background ?? this.background,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      white: white ?? this.white,
      neutral: neutral ?? this.neutral,
      red: red ?? this.red,
      amber: amber ?? this.amber,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      zinc: zinc ?? this.zinc,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;

    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      white: Color.lerp(white, other.white, t)!,
      neutral: neutral.lerp(other.neutral, t),
      red: red.lerp(other.red, t),
      amber: amber.lerp(other.amber, t),
      green: green.lerp(other.green, t),
      blue: blue.lerp(other.blue, t),
      zinc: zinc.lerp(other.zinc, t),
    );
  }
}
