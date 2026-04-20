import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../presentation.dart';

class SignInPage extends StatefulWidget {
  final SignInViewModel viewModel;
  const SignInPage({super.key, required this.viewModel});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInViewModel _viewModel;
  late ReactionDisposer _disposer;

  void _setupReactions() {
    _disposer = reaction((_) => (_viewModel.state, _viewModel.route), (_) {
      if (!mounted) return;

      if (_viewModel.state.isError) {
        SnackBarWidget.showError(context, _viewModel.message);
        return;
      }

      if (_viewModel.route.isHome) {
        Navigator.pushReplacementNamed(context, RoutesConstants.homeRoute);
        return;
      }

      if (_viewModel.route.isSignUp) {
        Navigator.pushNamed(context, RoutesConstants.signUpRoute.auth);
        return;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _setupReactions();
  }

  @override
  void dispose() {
    super.dispose();
    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: appColors.blue.c500,
      body: Observer(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ContentWrapperWidget(
                child: Column(
                  children: [
                    SignInHeaderWidget(),
                    Dimension.xl.vertical,
                    SignInFormWidget(
                      loading: _viewModel.state.isLoading,
                      onChangedEmail: _viewModel.setEmail,
                      onChangedPassword: _viewModel.setPassword,
                      onPressedSignIn: _viewModel.signIn,
                      onPressedSignUp: _viewModel.goToSignUp,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
