// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  late final _$stateAtom = Atom(
    name: '_SignInViewModelBase.state',
    context: context,
  );

  @override
  SignInState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SignInState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$routeAtom = Atom(
    name: '_SignInViewModelBase.route',
    context: context,
  );

  @override
  SignInRoute get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(SignInRoute value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_SignInViewModelBase.message',
    context: context,
  );

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_SignInViewModelBase.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_SignInViewModelBase.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$signInAsyncAction = AsyncAction(
    '_SignInViewModelBase.signIn',
    context: context,
  );

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$_SignInViewModelBaseActionController = ActionController(
    name: '_SignInViewModelBase',
    context: context,
  );

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
      name: '_SignInViewModelBase.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
      name: '_SignInViewModelBase.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToSignUp() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
      name: '_SignInViewModelBase.goToSignUp',
    );
    try {
      return super.goToSignUp();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearState() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
      name: '_SignInViewModelBase.clearState',
    );
    try {
      return super.clearState();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
route: ${route},
message: ${message},
email: ${email},
password: ${password}
    ''';
  }
}
