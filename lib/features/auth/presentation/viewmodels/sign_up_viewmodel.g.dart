// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  late final _$stateAtom = Atom(
    name: '_SignUpViewModelBase.state',
    context: context,
  );

  @override
  SignUpState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SignUpState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$routeAtom = Atom(
    name: '_SignUpViewModelBase.route',
    context: context,
  );

  @override
  SignUpRoute get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(SignUpRoute value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_SignUpViewModelBase.message',
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
    name: '_SignUpViewModelBase.email',
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
    name: '_SignUpViewModelBase.password',
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

  late final _$signUpAsyncAction = AsyncAction(
    '_SignUpViewModelBase.signUp',
    context: context,
  );

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignUpViewModelBaseActionController = ActionController(
    name: '_SignUpViewModelBase',
    context: context,
  );

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
      name: '_SignUpViewModelBase.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
      name: '_SignUpViewModelBase.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToSignIn() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
      name: '_SignUpViewModelBase.goToSignIn',
    );
    try {
      return super.goToSignIn();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearState() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
      name: '_SignUpViewModelBase.clearState',
    );
    try {
      return super.clearState();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
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
