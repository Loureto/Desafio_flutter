import 'package:desafio_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class AnnotationPageArguments {
  final AnnotationViewModel viewmodel;
  final AnnotationModel? annotationModel;

  const AnnotationPageArguments({
    required this.viewmodel,
    this.annotationModel,
  });
}

class AnnotationPage extends StatefulWidget {
  final AnnotationPageArguments arguments;

  const AnnotationPage({super.key, required this.arguments});

  @override
  State<AnnotationPage> createState() => _AnnotationPageState();
}

class _AnnotationPageState extends State<AnnotationPage> {
  late final AnnotationViewModel _viewModel;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final ReactionDisposer _disposer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setupReactions() {
    _disposer = reaction((_) => (_viewModel.state, _viewModel.route), (_) {
      if (!mounted) return;

      // if (_viewModel.state.isError && _viewModel.message.isNotEmpty) {
      //   SnackBarWidget.showError(context, _viewModel.message);
      //   _viewModel.clearMessage();
      //   return;
      // }

      if (_viewModel.route.isHome) {
        _viewModel.clearRoute();
        Modular.to.navigate(RoutesConstants.homeRoute);
      }
    });
  }

  Future<void> _confirmDelete() async {
    await DialogWidget.destructive(
      title: 'Excluir anotação',
      message: 'Esta ação não poderá ser desfeita.',
      primaryText: 'Excluir',
      primaryAction: () {
        Navigator.of(context).pop();
        _viewModel.delete();
      },
      secondaryText: 'Cancelar',
      secondaryAction: Navigator.of(context).pop,
      messageAlign: TextAlign.center,
    ).show(context, barrierDismissible: true);
  }

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _viewModel.save();
  }

  @override
  void initState() {
    super.initState();
    _viewModel = widget.arguments.viewmodel;
    _viewModel.initialize(widget.arguments.annotationModel);
    _titleController = TextEditingController(text: _viewModel.title);
    _descriptionController = TextEditingController(
      text: _viewModel.description,
    );
    _setupReactions();
  }

  @override
  void dispose() {
    _disposer();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final bottomActionPadding = MediaQuery.of(context).padding.bottom;

    return Observer(
      builder: (_) {
        return AbsorbPointer(
          absorbing: _viewModel.state.isLoading || _viewModel.state.isPending,
          child: Scaffold(
            appBar: AppBarWidget(
              title: _viewModel.isEditing
                  ? 'Editar anotação'
                  : 'Adicionar anotação',
              onTap: _viewModel.goBackHome,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 24.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: bottomActionPadding + 16.0,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.title(
                        _viewModel.isEditing
                            ? 'Atualize sua anotação'
                            : 'Crie uma nova anotação',
                        color: appColors.textPrimary,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                      Dimension.xs.vertical,
                      TextWidget.caption(
                        'Preencha os campos abaixo para salvar suas informações.',
                        color: appColors.textSecondary,
                      ),
                      Dimension.lg.vertical,
                      TextFieldWidget.text(
                        controller: _titleController,
                        labelText: 'Título',
                        hintText: 'Digite o título da anotação',
                        required: true,
                        maxLength: 60,
                        onChanged: _viewModel.setTitle,
                        validator: FormValidators.validField,
                      ),
                      Dimension.md.vertical,
                      TextFieldWidget.text(
                        controller: _descriptionController,
                        labelText: 'Descrição',
                        hintText: 'Descreva sua anotação',
                        required: true,
                        maxLines: 6,
                        maxLength: 500,
                        onChanged: _viewModel.setDescription,
                        validator: FormValidators.validField,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              color: appColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(bottom: bottomActionPadding + 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonWidget.primary(
                    appColors: appColors,
                    text: _viewModel.isEditing
                        ? 'Salvar alterações'
                        : 'Salvar anotação',
                    loading: _viewModel.state.isLoading,
                    onPressed: _viewModel.canSubmit ? _handleSubmit : null,
                    leading: const Icon(Icons.save_outlined, size: 20.0),
                  ),
                  Dimension.sm.vertical,
                  ButtonWidget.secondary(
                    appColors: appColors,
                    text: 'Excluir anotação',
                    onPressed: _viewModel.canDelete ? _confirmDelete : null,
                    leading: Icon(
                      Icons.delete_outline,
                      size: 20.0,
                      color: _viewModel.canDelete
                          ? appColors.blue.c500
                          : appColors.blue.c300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
