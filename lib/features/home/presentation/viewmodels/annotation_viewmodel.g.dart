// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnnotationViewModel on _AnnotationViewModelBase, Store {
  Computed<bool>? _$isEditingComputed;

  @override
  bool get isEditing => (_$isEditingComputed ??= Computed<bool>(
    () => super.isEditing,
    name: '_AnnotationViewModelBase.isEditing',
  )).value;
  Computed<bool>? _$canDeleteComputed;

  @override
  bool get canDelete => (_$canDeleteComputed ??= Computed<bool>(
    () => super.canDelete,
    name: '_AnnotationViewModelBase.canDelete',
  )).value;
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit => (_$canSubmitComputed ??= Computed<bool>(
    () => super.canSubmit,
    name: '_AnnotationViewModelBase.canSubmit',
  )).value;

  late final _$stateAtom = Atom(
    name: '_AnnotationViewModelBase.state',
    context: context,
  );

  @override
  AnnotationState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AnnotationState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$routeAtom = Atom(
    name: '_AnnotationViewModelBase.route',
    context: context,
  );

  @override
  AnnotationRoute get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(AnnotationRoute value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_AnnotationViewModelBase.message',
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

  late final _$annotationIdAtom = Atom(
    name: '_AnnotationViewModelBase.annotationId',
    context: context,
  );

  @override
  int? get annotationId {
    _$annotationIdAtom.reportRead();
    return super.annotationId;
  }

  @override
  set annotationId(int? value) {
    _$annotationIdAtom.reportWrite(value, super.annotationId, () {
      super.annotationId = value;
    });
  }

  late final _$titleAtom = Atom(
    name: '_AnnotationViewModelBase.title',
    context: context,
  );

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom = Atom(
    name: '_AnnotationViewModelBase.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$insertAsyncAction = AsyncAction(
    '_AnnotationViewModelBase.insert',
    context: context,
  );

  @override
  Future<void> insert(AnnotationModel annotation) {
    return _$insertAsyncAction.run(() => super.insert(annotation));
  }

  late final _$updateAsyncAction = AsyncAction(
    '_AnnotationViewModelBase.update',
    context: context,
  );

  @override
  Future<void> update(AnnotationModel annotation) {
    return _$updateAsyncAction.run(() => super.update(annotation));
  }

  late final _$saveAsyncAction = AsyncAction(
    '_AnnotationViewModelBase.save',
    context: context,
  );

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$deleteAsyncAction = AsyncAction(
    '_AnnotationViewModelBase.delete',
    context: context,
  );

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  late final _$_AnnotationViewModelBaseActionController = ActionController(
    name: '_AnnotationViewModelBase',
    context: context,
  );

  @override
  void initialize([AnnotationModel? annotation]) {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.initialize',
    );
    try {
      return super.initialize(annotation);
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBackHome() {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.goBackHome',
    );
    try {
      return super.goBackHome();
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearRoute() {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.clearRoute',
    );
    try {
      return super.clearRoute();
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMessage() {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.clearMessage',
    );
    try {
      return super.clearMessage();
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearForm() {
    final _$actionInfo = _$_AnnotationViewModelBaseActionController.startAction(
      name: '_AnnotationViewModelBase.clearForm',
    );
    try {
      return super.clearForm();
    } finally {
      _$_AnnotationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
route: ${route},
message: ${message},
annotationId: ${annotationId},
title: ${title},
description: ${description},
isEditing: ${isEditing},
canDelete: ${canDelete},
canSubmit: ${canSubmit}
    ''';
  }
}
