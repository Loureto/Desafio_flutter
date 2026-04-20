import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Column(
      children: [
        TextWidget.title(
          'Crie sua conta',
          color: appColors.zinc.c900,
          textAlign: TextAlign.center,
        ),
        Dimension.xs.vertical,
        TextWidget.subtitle(
          'Cadastre seu email e senha para acessar suas anotacoes.',
          color: appColors.textSecondary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
