import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';

part 'splash_viewmodel.g.dart';

enum SplashRoute {
  home(RoutesConstants.homeRoute),
  login(RoutesConstants.authRoute);

  final String route;
  const SplashRoute(this.route);
}

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  final IAuthTokenStorageAdapter _authTokenStorage;

  _SplashViewModelBase(this._authTokenStorage);

  @observable
  SplashRoute? route;

  @action
  Future<void> isAuthenticated() async {
    final token = await _authTokenStorage.getToken();
    final hasToken = token != null && token.trim().isNotEmpty;

    route = hasToken ? SplashRoute.home : SplashRoute.login;
  }
}
