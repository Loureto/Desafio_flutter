// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<bool>? _$hasAnnotationsComputed;

  @override
  bool get hasAnnotations => (_$hasAnnotationsComputed ??= Computed<bool>(
    () => super.hasAnnotations,
    name: '_HomeViewModelBase.hasAnnotations',
  )).value;

  late final _$stateAtom = Atom(
    name: '_HomeViewModelBase.state',
    context: context,
  );

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$routeAtom = Atom(
    name: '_HomeViewModelBase.route',
    context: context,
  );

  @override
  HomeRoute get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(HomeRoute value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_HomeViewModelBase.message',
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

  late final _$annotationsAtom = Atom(
    name: '_HomeViewModelBase.annotations',
    context: context,
  );

  @override
  ObservableList<AnnotationModel> get annotations {
    _$annotationsAtom.reportRead();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<AnnotationModel> value) {
    _$annotationsAtom.reportWrite(value, super.annotations, () {
      super.annotations = value;
    });
  }

  late final _$initializeAsyncAction = AsyncAction(
    '_HomeViewModelBase.initialize',
    context: context,
  );

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$getAnnotationsAsyncAction = AsyncAction(
    '_HomeViewModelBase.getAnnotations',
    context: context,
  );

  @override
  Future<void> getAnnotations() {
    return _$getAnnotationsAsyncAction.run(() => super.getAnnotations());
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_HomeViewModelBase.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$refreshAsyncAction = AsyncAction(
    '_HomeViewModelBase.refresh',
    context: context,
  );

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$deleteAnnotationAsyncAction = AsyncAction(
    '_HomeViewModelBase.deleteAnnotation',
    context: context,
  );

  @override
  Future<void> deleteAnnotation(int id) {
    return _$deleteAnnotationAsyncAction.run(() => super.deleteAnnotation(id));
  }

  late final _$_HomeViewModelBaseActionController = ActionController(
    name: '_HomeViewModelBase',
    context: context,
  );

  @override
  void clearMessage() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.clearMessage',
    );
    try {
      return super.clearMessage();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToAddAnnotation() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.goToAddAnnotation',
    );
    try {
      return super.goToAddAnnotation();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToAnnotationDetail() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.goToAnnotationDetail',
    );
    try {
      return super.goToAnnotationDetail();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearRoute() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.clearRoute',
    );
    try {
      return super.clearRoute();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
route: ${route},
message: ${message},
annotations: ${annotations},
hasAnnotations: ${hasAnnotations}
    ''';
  }
}
