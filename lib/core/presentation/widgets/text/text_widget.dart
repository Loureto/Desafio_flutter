import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppFontSize {
  xsmall(12.0),
  small(14.0),
  medium(16.0),
  large(18.0),
  xlarge(20.0);

  final double size;
  const AppFontSize(this.size);
}

enum AppFontWeight {
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700);

  final FontWeight weight;
  const AppFontWeight(this.weight);
}

class TextWidget extends StatelessWidget {
  final String text;
  final AppFontSize fontSize;
  final AppFontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const TextWidget._({
    super.key,
    this.text = '',
    this.fontSize = AppFontSize.medium,
    this.fontWeight = AppFontWeight.regular,
    this.color,
    this.textAlign,
  });

  factory TextWidget.base(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    AppFontWeight fontWeight = AppFontWeight.regular,
  }) {
    return TextWidget._(
      key: key,
      fontSize: AppFontSize.medium,
      text: text,
      color: color,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  factory TextWidget.title(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    AppFontWeight fontWeight = AppFontWeight.bold,
  }) {
    return TextWidget._(
      key: key,
      fontSize: AppFontSize.large,
      text: text,
      color: color,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  factory TextWidget.subtitle(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    AppFontWeight fontWeight = AppFontWeight.regular,
  }) {
    return TextWidget._(
      key: key,
      fontSize: AppFontSize.medium,
      text: text,
      color: color,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  factory TextWidget.caption(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    AppFontWeight fontWeight = AppFontWeight.regular,
  }) {
    return TextWidget._(
      key: key,
      fontSize: AppFontSize.small,
      text: text,
      color: color,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  factory TextWidget.button(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    AppFontWeight fontWeight = AppFontWeight.semiBold,
  }) {
    return TextWidget._(
      key: key,
      fontSize: AppFontSize.small,
      text: text,
      color: color,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize.size,
        fontWeight: fontWeight.weight,
      ),
    );
  }
}
