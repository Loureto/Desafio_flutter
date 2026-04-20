import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'presentation/presentation.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton<SplashViewModel>(SplashViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      RoutesConstants.initialRoute,
      child: (context) => SplashPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
