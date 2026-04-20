import 'package:desafio_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? fontSize;

  const TextButtonWidget._({
    required this.text,
    required this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.onPressed,
    this.padding,
    this.fontSize,
  });

  factory TextButtonWidget.regular({
    required String text,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    VoidCallback? onPressed,
    EdgeInsets padding = EdgeInsets.zero,
  }) => TextButtonWidget._(
    text: text,
    style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.w400, fontSize: 14.0),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    onPressed: onPressed,
    padding: padding,
    fontSize: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColors;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(padding ?? EdgeInsets.zero),
        textStyle: WidgetStateProperty.all(const TextStyle(decoration: TextDecoration.none)),
      ),
      child: Text(
        text,
        style: style.copyWith(
          fontSize: fontSize ?? style.fontSize,
          color: style.color ?? appColor.amber.c500,
        ),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
