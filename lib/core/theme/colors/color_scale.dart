import 'package:flutter/material.dart';

class ColorScale {
  final Color c50;
  final Color c100;
  final Color c200;
  final Color c300;
  final Color c400;
  final Color c500;
  final Color c600;
  final Color c700;
  final Color c800;
  final Color c900;
  final Color c950;

  const ColorScale({
    required this.c50,
    required this.c100,
    required this.c200,
    required this.c300,
    required this.c400,
    required this.c500,
    required this.c600,
    required this.c700,
    required this.c800,
    required this.c900,
    required this.c950,
  });

  ColorScale lerp(ColorScale other, double t) {
    return ColorScale(
      c50: Color.lerp(c50, other.c50, t)!,
      c100: Color.lerp(c100, other.c100, t)!,
      c200: Color.lerp(c200, other.c200, t)!,
      c300: Color.lerp(c300, other.c300, t)!,
      c400: Color.lerp(c400, other.c400, t)!,
      c500: Color.lerp(c500, other.c500, t)!,
      c600: Color.lerp(c600, other.c600, t)!,
      c700: Color.lerp(c700, other.c700, t)!,
      c800: Color.lerp(c800, other.c800, t)!,
      c900: Color.lerp(c900, other.c900, t)!,
      c950: Color.lerp(c950, other.c950, t)!,
    );
  }
}
