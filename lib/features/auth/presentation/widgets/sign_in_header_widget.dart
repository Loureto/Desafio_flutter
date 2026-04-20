import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SignInHeaderWidget extends StatefulWidget {
  const SignInHeaderWidget({super.key});

  @override
  State<SignInHeaderWidget> createState() => _SignInHeaderWidgetState();
}

class _SignInHeaderWidgetState extends State<SignInHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Column(
      children: [
        TextWidget.title(
          'Bem-vindo de volta!',
          color: appColors.zinc.c900,
          textAlign: TextAlign.center,
        ),
        Dimension.xs.vertical,
        TextWidget.subtitle(
          'Entre com seu email e senha para continuar.',
          color: appColors.textSecondary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
