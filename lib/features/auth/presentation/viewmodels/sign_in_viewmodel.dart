import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'sign_in_viewmodel.g.dart';

enum SignInState { initial, loading, success, error }

enum SignInRoute { initial, home, signUp }

extension SignInRouteExtension on SignInRoute {
  bool get isHome => this == SignInRoute.home;
  bool get isSignUp => this == SignInRoute.signUp;
}

extension SignInStateExtension on SignInState {
  bool get isInitial => this == SignInState.initial;
  bool get isLoading => this == SignInState.loading;
  bool get isSuccess => this == SignInState.success;
  bool get isError => this == SignInState.error;
}

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store {
  final IAuthRepository _authRepository;
  final IAuthTokenStorageAdapter _authTokenStorage;

  _SignInViewModelBase(this._authRepository, this._authTokenStorage);

  @observable
  SignInState state = SignInState.initial;

  @observable
  SignInRoute route = SignInRoute.initial;

  @observable
  String message = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  Future<void> signIn() async {
    state = SignInState.loading;
    message = '';

    final result = await _authRepository.signIn(email, password);

    result.fold(
      (failure) {
        state = SignInState.error;
        message = failure.message;
      },
      (account) async {
        await _authTokenStorage.saveSession(
          userId: account.userId,
          token: account.accessToken,
          refreshToken: account.refreshToken,
        );
        route = SignInRoute.home;
      },
    );
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void goToSignUp() {
    route = SignInRoute.signUp;
  }

  @action
  void clearState() {
    state = SignInState.initial;
    route = SignInRoute.initial;
    message = '';
    email = '';
    password = '';
  }
}
