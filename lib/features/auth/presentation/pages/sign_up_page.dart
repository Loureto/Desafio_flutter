import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../presentation.dart';

class SignUpPage extends StatefulWidget {
  final SignUpViewModel viewModel;

  const SignUpPage({super.key, required this.viewModel});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpViewModel _viewModel;
  late final ReactionDisposer _disposer;

  void _setupReactions() {
    _disposer = reaction((_) => (_viewModel.state, _viewModel.route), (_) {
      if (!mounted) return;

      if (_viewModel.state.isError && _viewModel.message.isNotEmpty) {
        SnackBarWidget.showError(context, _viewModel.message);
        return;
      }

      if (_viewModel.state.isSuccess && _viewModel.message.isNotEmpty) {
        SnackBarWidget.showSuccess(context, _viewModel.message);
      }

      if (_viewModel.route.isSignIn) {
        _viewModel.clearState();
        Navigator.pushReplacementNamed(context, RoutesConstants.authRoute);
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
    _disposer();
    super.dispose();
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
                    const SignUpHeaderWidget(),
                    Dimension.xl.vertical,
                    SignUpFormWidget(
                      loading: _viewModel.state.isLoading,
                      onChangedEmail: _viewModel.setEmail,
                      onChangedPassword: _viewModel.setPassword,
                      onPressedSignUp: _viewModel.signUp,
                      onPressedBackToSignIn: _viewModel.goToSignIn,
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
