import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    // Datasources
    i.addLazySingleton<IAuthRemoteDataSource>(AuthRemoteDataSource.new);

    // Repositories
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);

    // ViewModels
    i.addLazySingleton<SignInViewModel>(SignInViewModel.new);
    i.addLazySingleton<SignUpViewModel>(SignUpViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      RoutesConstants.initialRoute,
      child: (context) => SignInPage(viewModel: Modular.get<SignInViewModel>()),
    );

    r.child(
      RoutesConstants.signUpRoute,
      child: (context) => SignUpPage(viewModel: Modular.get<SignUpViewModel>()),
    );
  }
}
