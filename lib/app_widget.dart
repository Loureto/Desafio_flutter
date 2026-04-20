import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemeConfig.light(),
      darkTheme: AppThemeConfig.dark(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => child!,
    );
  }
}
