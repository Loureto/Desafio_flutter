import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'home_viewmodel.g.dart';

enum HomeState { initial, loading, success, pending, error }

enum HomeRoute { initial, signIn, addAnnotation, annotationDetail }

extension HomeStateExtension on HomeState {
  bool get isInitial => this == HomeState.initial;
  bool get isLoading => this == HomeState.loading;
  bool get isSuccess => this == HomeState.success;
  bool get isPending => this == HomeState.pending;
  bool get isError => this == HomeState.error;
}

extension HomeRouteExtension on HomeRoute {
  bool get isInitial => this == HomeRoute.initial;
  bool get isSignIn => this == HomeRoute.signIn;
  bool get isAddAnnotation => this == HomeRoute.addAnnotation;
  bool get isAnnotationDetail => this == HomeRoute.annotationDetail;
}

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final IHomeRepository _homeRepository;
  final IAuthTokenStorageAdapter _authTokenStorage;

  _HomeViewModelBase(this._homeRepository, this._authTokenStorage);

  @observable
  HomeState state = HomeState.initial;

  @observable
  HomeRoute route = HomeRoute.initial;

  @observable
  String message = '';

  @observable
  ObservableList<AnnotationModel> annotations =
      ObservableList<AnnotationModel>();

  @computed
  bool get hasAnnotations => annotations.isNotEmpty;

  @action
  Future<void> initialize() async {
    await getAnnotations();
  }

  @action
  Future<void> getAnnotations() async {
    state = HomeState.loading;
    message = '';

    final result = await _homeRepository.getAnnotations();

    result.fold(
      (failure) {
        state = HomeState.error;
        message = failure.message;
      },
      (data) {
        annotations = ObservableList<AnnotationModel>.of(data);
        state = HomeState.initial;
      },
    );
  }

  @action
  void clearMessage() {
    message = '';
  }

  @action
  Future<void> logout() async {
    state = HomeState.pending;
    message = '';

    final result = await _homeRepository.logout();

    result.fold(
      (failure) {
        state = HomeState.error;
        message = failure.message;
      },
      (_) {
        _authTokenStorage.clearSession();
        state = HomeState.initial;
        route = HomeRoute.signIn;
      },
    );
  }

  @action
  Future<void> refresh() async {
    await getAnnotations();
  }

  @action
  Future<void> deleteAnnotation(int id) async {
    state = HomeState.pending;
    message = '';

    final result = await _homeRepository.deleteAnnotation(id);

    result.fold(
      (failure) {
        state = HomeState.error;
        message = failure.message;
      },
      (_) async {
        await getAnnotations();
      },
    );
  }

  @action
  void goToAddAnnotation() {
    route = HomeRoute.addAnnotation;
  }

  @action
  void goToAnnotationDetail() {
    route = HomeRoute.annotationDetail;
  }

  @action
  void clearRoute() {
    route = HomeRoute.initial;
  }
}
