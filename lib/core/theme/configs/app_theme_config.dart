import 'package:flutter/material.dart';

import '../theme.dart';

class AppThemeConfig {
  static const AppColors _themeLight = ThemeColors.themeLight;

  static const AppColors _themeDark = ThemeColors.themeDark;

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _themeLight.background,
      extensions: [_themeLight],
      appBarTheme: AppBarThemeConfig.appBarThemeData(_themeLight),
      inputDecorationTheme: TextFieldThemeConfig.decorationTheme(_themeLight),
      // elevatedButtonTheme: AppElevatedButton.light(),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _themeDark.background,
      extensions: [_themeDark],
      appBarTheme: AppBarThemeConfig.appBarThemeData(_themeDark),
      inputDecorationTheme: TextFieldThemeConfig.decorationTheme(_themeDark),
      // elevatedButtonTheme: AppElevatedButton.dark(),
    );
  }
}
