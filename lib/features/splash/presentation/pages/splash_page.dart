import 'package:desafio_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashViewModel _viewModel;
  late final ReactionDisposer _routeDisposer;

  @override
  void initState() {
    super.initState();
    _viewModel = SplashViewModel(Modular.get<IAuthTokenStorageAdapter>());
    _routeDisposer = reaction<SplashRoute?>((_) => _viewModel.route, (route) {
      if (route == null) return;
      Modular.to.navigate(route.route);
    });
    Future.microtask(_viewModel.isAuthenticated);
  }

  @override
  void dispose() {
    _routeDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: appColor.blue.c500,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              BaseAppAssets.logoNotes,
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
