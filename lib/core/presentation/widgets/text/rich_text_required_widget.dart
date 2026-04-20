import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core.dart';

class RichTextRequiredWidget extends StatelessWidget {
  final String text;
  final bool required;

  const RichTextRequiredWidget({
    required this.text,
    required this.required,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$text ',
            style: GoogleFonts.poppins(
              color: appColors.neutral.c900,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
          if (required)
            TextSpan(
              text: '*',
              style: GoogleFonts.poppins(
                color: appColors.red.c500,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
        ],
      ),
    );
  }
}
