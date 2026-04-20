import 'package:flutter/material.dart';

import '../theme.dart';

class SizeConfig {
  late int designScreenWidth;

  late int designScreenHeight;

  SizeConfig._({
    required this.designScreenHeight,
    required this.designScreenWidth,
  });

  factory SizeConfig.init() {
    return SizeConfig._(
      designScreenHeight: AppThemeBase.designScreenHeight,
      designScreenWidth: AppThemeBase.designScreenWidth,
    );
  }

  static late double _screenWidth;

  static late double _screenHeight;

  static double textMultiplier = 1;

  static double imageSizeMultiplier = 1;

  static double heightMultiplier = 1;

  static double widthMultiplier = 1;

  static bool isPortrait = true;

  static bool isMobilePortrait = false;

  void config(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
    imageSizeMultiplier = heightMultiplier = _screenHeight / designScreenHeight;
    widthMultiplier = textMultiplier = _screenWidth / designScreenWidth;
  }
}