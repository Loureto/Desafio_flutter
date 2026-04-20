import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';

part 'sign_up_viewmodel.g.dart';

enum SignUpState { initial, loading, success, error }

enum SignUpRoute { initial, signIn }

extension SignUpStateExtension on SignUpState {
  bool get isInitial => this == SignUpState.initial;
  bool get isLoading => this == SignUpState.loading;
  bool get isSuccess => this == SignUpState.success;
  bool get isError => this == SignUpState.error;
}

extension SignUpRouteExtension on SignUpRoute {
  bool get isInitial => this == SignUpRoute.initial;
  bool get isSignIn => this == SignUpRoute.signIn;
}

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  final IAuthRepository _authRepository;

  _SignUpViewModelBase(this._authRepository);

  @observable
  SignUpState state = SignUpState.initial;

  @observable
  SignUpRoute route = SignUpRoute.initial;

  @observable
  String message = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  Future<void> signUp() async {
    state = SignUpState.loading;
    message = '';

    final result = await _authRepository.signUp(email, password);

    result.fold(
      (failure) {
        state = SignUpState.error;
        message = failure.message;
      },
      (success) {
        state = SignUpState.success;
        message = 'Conta criada com sucesso';
        route = SignUpRoute.signIn;
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
  void goToSignIn() {
    route = SignUpRoute.signIn;
  }

  @action
  void clearState() {
    state = SignUpState.initial;
    route = SignUpRoute.initial;
    message = '';
    email = '';
    password = '';
  }
}
