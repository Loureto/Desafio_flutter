import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core.dart';

class AppBarThemeConfig {
  const AppBarThemeConfig._();

  static AppBarThemeData appBarThemeData(AppColors appColors) =>
      AppBarThemeData(
        backgroundColor: appColors.blue.c500,
        iconTheme: IconThemeData(size: 30.0, color: appColors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: appColors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      );
}
