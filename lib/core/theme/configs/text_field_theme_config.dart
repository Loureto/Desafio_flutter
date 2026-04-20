import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core.dart';

class TextFieldThemeConfig {
  const TextFieldThemeConfig._();

  static InputDecorationTheme decorationTheme(AppColors appColors) {
    final border = _border(appColors);
    final errorBorder = _errorBorder(appColors);
    final style = _style(appColors);

    return InputDecorationTheme(
      filled: true,
      fillColor: _fillColor(appColors),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimension.sm.value,
        vertical: 10.0,
      ),
      border: border,
      enabledBorder: border,
      focusedBorder: _focusedBorder(appColors),
      disabledBorder: _disabledBorder(appColors),
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      hintStyle: style,
      labelStyle: labelStyle(appColors),
    );
  }

  static Color _fillColor(AppColors appColors) =>
      WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return appColors.zinc.c50;
        return appColors.white;
      });

  static final BorderRadius _borderRadius = BorderRadius.circular(
    Dimension.xs.value,
  );

  static InputBorder _border(AppColors appColors) =>
      _inputBorder(appColors.zinc.c300);

  static InputBorder _focusedBorder(AppColors appColors) =>
      _inputBorder(appColors.blue.c500);

  static InputBorder _disabledBorder(AppColors appColors) =>
      _inputBorder(appColors.zinc.c300);

  static InputBorder _errorBorder(AppColors appColors) =>
      _inputBorder(appColors.red.c500);

  static InputBorder _inputBorder(Color color) => OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: color),
  );

  static TextStyle _style(AppColors appColors) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: appColors.zinc.c500,
    height: 1.5, //24px
  );

  static TextStyle labelStyle(AppColors appColors) =>
      _style(appColors).copyWith(color: appColors.neutral.c700);
}
