import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'color_scale.dart';

class ThemeColorsLight {
  const ThemeColorsLight._();

  static const theme = AppColors(
    background: Color(0xFFFFFFFF),

    textPrimary: Color(0xFF171717),
    textSecondary: Color(0xFF525252),

    white: Color(0xFFFFFFFF),

    neutral: ColorScale(
      c50: Color(0xFFFAFAFA),
      c100: Color(0xFFF5F5F5),
      c200: Color(0xFFE5E5E5),
      c300: Color(0xFFD4D4D4),
      c400: Color(0xFFA3A3A3),
      c500: Color(0xFF737373),
      c600: Color(0xFF525252),
      c700: Color(0xFF404040),
      c800: Color(0xFF262626),
      c900: Color(0xFF171717),
      c950: Color(0xFF0A0A0A),
    ),

    red: ColorScale(
      c50: Color(0xFFFEF2F2),
      c100: Color(0xFFFEE2E2),
      c200: Color(0xFFFECACA),
      c300: Color(0xFFFCA5A5),
      c400: Color(0xFFF87171),
      c500: Color(0xFFEF4444),
      c600: Color(0xFFDC2626),
      c700: Color(0xFFB91C1C),
      c800: Color(0xFF991B1B),
      c900: Color(0xFF7F1D1D),
      c950: Color(0xFF450A0A),
    ),

    amber: ColorScale(
      c50: Color(0xFFFFFBEB),
      c100: Color(0xFFFEF3C7),
      c200: Color(0xFFFDE68A),
      c300: Color(0xFFFCD34D),
      c400: Color(0xFFFBBF24),
      c500: Color(0xFFF59E0B),
      c600: Color(0xFFD97706),
      c700: Color(0xFFB45309),
      c800: Color(0xFF92400E),
      c900: Color(0xFF78350F),
      c950: Color(0xFF451A03),
    ),

    green: ColorScale(
      c50: Color(0xFFF0FDF4),
      c100: Color(0xFFDCFCE7),
      c200: Color(0xFFBBF7D0),
      c300: Color(0xFF86EFAC),
      c400: Color(0xFF4ADE80),
      c500: Color(0xFF22C55E),
      c600: Color(0xFF16A34A),
      c700: Color(0xFF15803D),
      c800: Color(0xFF166534),
      c900: Color(0xFF14532D),
      c950: Color(0xFF052E16),
    ),

    blue: ColorScale(
      c50: Color(0xFFEFF6FF),
      c100: Color(0xFFDBEAFE),
      c200: Color(0xFFBFDBFE),
      c300: Color(0xFF93C5FD),
      c400: Color(0xFF60A5FA),
      c500: Color(0xFF3B82F6),
      c600: Color(0xFF2563EB),
      c700: Color(0xFF1D4ED8),
      c800: Color(0xFF1E40AF),
      c900: Color(0xFF1E3A8A),
      c950: Color(0xFF172554),
    ),

    zinc: ColorScale(
      c50: Color(0xFFFAFAFA),
      c100: Color(0xFFF4F4F5),
      c200: Color(0xFFE4E4E7),
      c300: Color(0xFFD4D4D8),
      c400: Color(0xFFA1A1AA),
      c500: Color(0xFF71717A),
      c600: Color(0xFF52525B),
      c700: Color(0xFF3F3F46),
      c800: Color(0xFF27272A),
      c900: Color(0xFF18181B),
      c950: Color(0xFF09090B),
    ),
  );
}
