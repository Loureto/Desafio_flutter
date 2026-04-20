import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';

part 'annotation_viewmodel.g.dart';

enum AnnotationState { initial, loading, success, pending, error }

enum AnnotationRoute { initial, home, annotationDetail }

extension AnnotationStateExtension on AnnotationState {
  bool get isInitial => this == AnnotationState.initial;
  bool get isLoading => this == AnnotationState.loading;
  bool get isSuccess => this == AnnotationState.success;
  bool get isPending => this == AnnotationState.pending;
  bool get isError => this == AnnotationState.error;
}

extension AnnotationRouteExtension on AnnotationRoute {
  bool get isInitial => this == AnnotationRoute.initial;
  bool get isHome => this == AnnotationRoute.home;
  bool get isAnnotationDetail => this == AnnotationRoute.annotationDetail;
}

class AnnotationViewModel = _AnnotationViewModelBase with _$AnnotationViewModel;

abstract class _AnnotationViewModelBase with Store {
  final IHomeRepository _homeRepository;

  int? _annotationId;

  _AnnotationViewModelBase(this._homeRepository);

  @observable
  AnnotationState state = AnnotationState.initial;

  @observable
  AnnotationRoute route = AnnotationRoute.initial;

  @observable
  String message = '';

  @observable
  int? annotationId;

  @observable
  String title = '';

  @observable
  String description = '';

  @computed
  bool get isEditing => annotationId != null && annotationId! > 0;

  @computed
  bool get canDelete => isEditing;

  @computed
  bool get canSubmit =>
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty &&
      !state.isLoading &&
      !state.isPending;

  @action
  void initialize([AnnotationModel? annotation]) {
    if (annotation == null) {
      clearForm();
      return;
    }

    _annotationId = annotation.id;
    annotationId = annotation.id;
    title = annotation.title;
    description = annotation.description;
    message = '';
    state = AnnotationState.initial;
    route = AnnotationRoute.initial;
  }

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  Future<void> insert(AnnotationModel annotation) async {
    state = AnnotationState.loading;
    message = '';

    final result = await _homeRepository.addAnnotation(annotation);

    result.fold(
      (failure) {
        state = AnnotationState.error;
        message = failure.message;
      },
      (_) {
        state = AnnotationState.success;
        route = AnnotationRoute.home;
      },
    );
  }

  @action
  Future<void> update(AnnotationModel annotation) async {
    state = AnnotationState.loading;
    message = '';

    final result = await _homeRepository.editAnnotation(annotation);

    result.fold(
      (failure) {
        state = AnnotationState.error;
        message = failure.message;
      },
      (_) {
        state = AnnotationState.success;
        route = AnnotationRoute.home;
      },
    );
  }

  @action
  Future<void> save() async {
    final annotation = AnnotationModel(
      id: _annotationId,
      title: title,
      description: description,
    );

    if (isEditing) {
      await update(annotation);
      return;
    }

    await insert(annotation);
  }

  @action
  Future<void> delete() async {
    if (!canDelete || annotationId == null) {
      return;
    }

    state = AnnotationState.loading;
    message = '';

    final result = await _homeRepository.deleteAnnotation(annotationId!);

    result.fold(
      (failure) {
        state = AnnotationState.error;
        message = failure.message;
      },
      (_) {
        state = AnnotationState.success;
        route = AnnotationRoute.home;
      },
    );
  }

  @action
  void goBackHome() {
    route = AnnotationRoute.home;
  }

  @action
  void clearRoute() {
    route = AnnotationRoute.initial;
  }

  @action
  void clearMessage() {
    message = '';
  }

  @action
  void clearForm() {
    _annotationId = null;
    annotationId = null;
    title = '';
    description = '';
    message = '';
    state = AnnotationState.initial;
    route = AnnotationRoute.initial;
  }
}
