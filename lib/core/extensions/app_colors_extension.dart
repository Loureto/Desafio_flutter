import 'package:flutter/material.dart';

import '../core.dart';

extension AppColorsExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
