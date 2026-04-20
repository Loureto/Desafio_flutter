import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    // Datasources
    i.addLazySingleton<IHomeRemoteDataSource>(HomeRemoteDataSource.new);

    // Repositories
    i.addLazySingleton<IHomeRepository>(HomeRepository.new);

    // ViewModels
    i.addLazySingleton<AnnotationViewModel>(AnnotationViewModel.new);
    i.addLazySingleton<HomeViewModel>(HomeViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      RoutesConstants.initialRoute,
      child: (context) => HomePage(viewmodel: Modular.get<HomeViewModel>()),
    );

    r.child(
      RoutesConstants.addAnnotationRoute,
      child: (context) => AnnotationPage(
        arguments: AnnotationPageArguments(
          viewmodel: Modular.get<AnnotationViewModel>(),
          annotationModel: r.args.data,
        ),
      ),
    );

    r.child(
      RoutesConstants.annotationDetailRoute,
      child: (context) => SizedBox.shrink(),
    );
  }
}
