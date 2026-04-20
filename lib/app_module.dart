import 'package:desafio_flutter/core/core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/features.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.module(
      RoutesConstants.initialRoute,
      module: SplashModule(),
      transition: TransitionType.fadeIn,
    );

    r.module(
      RoutesConstants.authRoute,
      module: AuthModule(),
      transition: TransitionType.fadeIn,
    );

    r.module(
      RoutesConstants.homeRoute,
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
