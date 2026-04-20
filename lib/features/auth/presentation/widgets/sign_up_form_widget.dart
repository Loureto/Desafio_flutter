import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SignUpFormWidget extends StatefulWidget {
  final bool loading;
  final ValueChanged<String>? onChangedEmail;
  final ValueChanged<String>? onChangedPassword;
  final VoidCallback? onPressedSignUp;
  final VoidCallback? onPressedBackToSignIn;

  const SignUpFormWidget({
    super.key,
    this.loading = false,
    this.onChangedEmail,
    this.onChangedPassword,
    this.onPressedSignUp,
    this.onPressedBackToSignIn,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    widget.onPressedSignUp?.call();
  }

  String? _validateConfirmPassword(String? value) {
    final error = FormValidators.validPassword(value);

    if (error != null) {
      return error;
    }

    if (value != _passwordController.text) {
      return 'As senhas devem ser iguais';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
            hintText: 'Crie uma senha segura',
            onChanged: widget.onChangedPassword,
            validator: FormValidators.validPassword,
          ),
          Dimension.sm.vertical,
          TextFieldWidget.password(
            controller: _confirmPasswordController,
            labelText: 'Confirmar senha',
            hintText: 'Repita sua senha',
            validator: _validateConfirmPassword,
          ),
          Dimension.lg.vertical,
          ButtonWidget.primary(
            appColors: appColors,
            loading: widget.loading,
            text: 'Cadastrar conta',
            onPressed: _handleSubmit,
          ),
          Dimension.sm.vertical,
          ButtonWidget.secondary(
            appColors: appColors,
            text: 'Voltar para login',
            onPressed: widget.onPressedBackToSignIn,
          ),
        ],
      ),
    );
  }
}
