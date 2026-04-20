import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SignInFormWidget extends StatefulWidget {
  final bool loading;
  final ValueChanged<String>? onChangedEmail;
  final ValueChanged<String>? onChangedPassword;
  final VoidCallback? onPressedSignIn;
  final VoidCallback? onPressedSignUp;

  const SignInFormWidget({
    super.key,
    this.loading = false,
    this.onChangedEmail,
    this.onChangedPassword,
    this.onPressedSignIn,
    this.onPressedSignUp,
  });

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          TextFieldWidget.text(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Digite seu email',
            onChanged: widget.onChangedEmail,
            validator: FormValidators.validEmail,
          ),
          Dimension.sm.vertical,
          TextFieldWidget.password(
            controller: _passwordController,
            labelText: 'Senha',
            hintText: 'Digite sua senha',
            onChanged: widget.onChangedPassword,
            validator: FormValidators.validPassword,
          ),
          Dimension.lg.vertical,
          ButtonWidget.primary(
            appColors: appColors,
            loading: widget.loading,
            text: 'Entrar',
            onPressed: widget.onPressedSignIn,
          ),
          Dimension.sm.vertical,
          ButtonWidget.secondary(
            appColors: appColors,
            text: 'Criar conta',
            onPressed: widget.onPressedSignUp,
          ),
        ],
      ),
    );
  }
}
