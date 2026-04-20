import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewmodel;

  const HomePage({super.key, required this.viewmodel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel _viewModel;
  late ReactionDisposer _disposer;

  Future<void> _goToCreateAnnotation() async {
    await Modular.to.pushNamed(RoutesConstants.addAnnotationRoute.home);
    await _viewModel.refresh();
  }

  Future<void> _goToEditAnnotation(AnnotationModel annotation) async {
    await Modular.to.pushNamed(
      RoutesConstants.addAnnotationRoute.home,
      arguments: annotation,
    );
    await _viewModel.refresh();
  }

  Future<void> _confirmDeleteAnnotation(AnnotationModel annotation) async {
    await DialogWidget.destructive(
      title: 'Excluir anotação',
      message: 'Esta ação não poderá ser desfeita.',
      primaryText: 'Excluir',
      primaryAction: () {
        Navigator.of(context).pop();
        _viewModel.deleteAnnotation(annotation.id!);
      },
      secondaryText: 'Cancelar',
      secondaryAction: Navigator.of(context).pop,
      messageAlign: TextAlign.center,
    ).show(context, barrierDismissible: true);
  }

  void _setupReactions() {
    _disposer = reaction((_) => (_viewModel.state, _viewModel.route), (_) {
      if (!mounted) return;

      if (_viewModel.state.isError && _viewModel.message.isNotEmpty) {
        SnackBarWidget.showError(context, _viewModel.message);
        _viewModel.clearMessage();
      }

      if (_viewModel.route.isSignIn) {
        _viewModel.clearRoute();
        Modular.to.navigate(RoutesConstants.authRoute);
        return;
      }

      if (_viewModel.route.isAddAnnotation) {
        _viewModel.clearRoute();
        _goToCreateAnnotation();
        return;
      }

      if (_viewModel.route.isAnnotationDetail) {
        _viewModel.clearRoute();
        Modular.to.pushNamed(RoutesConstants.annotationDetailRoute.home);
        return;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewmodel;
    _viewModel.initialize();
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

    return Observer(
      builder: (_) => AbsorbPointer(
        absorbing: _viewModel.state.isLoading || _viewModel.state.isPending,
        child: Scaffold(
          appBar: AppBarWidget(
            title: 'Anotações',
            disabledLeading: true,
            actions: [
              IconButton(
                onPressed: _viewModel.logout,
                icon: const Icon(Icons.logout, size: 24.0),
              ),
            ],
          ),
          body: _buildBody(appColors),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _goToCreateAnnotation,
            backgroundColor: appColors.blue.c500,
            foregroundColor: appColors.white,
            icon: const Icon(Icons.add),
            label: const Text('Cadastrar'),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(AppColors appColors) {
    if (_viewModel.state.isLoading && !_viewModel.hasAnnotations) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_viewModel.state.isError && !_viewModel.hasAnnotations) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget.subtitle(
                'Nao foi possivel carregar suas anotacoes.',
                textAlign: TextAlign.center,
                fontWeight: AppFontWeight.semiBold,
              ),
              Dimension.sm.vertical,
              TextWidget.caption(
                _viewModel.message,
                textAlign: TextAlign.center,
                color: appColors.textSecondary,
              ),
              Dimension.lg.vertical,
              IntrinsicWidth(
                child: ButtonWidget.secondary(
                  appColors: appColors,
                  text: 'Tentar novamente',
                  onPressed: _viewModel.getAnnotations,
                  leading: const Icon(Icons.refresh, size: 20.0),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!_viewModel.hasAnnotations) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: TextWidget.caption('Nenhuma anotação encontrada.')),
          Dimension.sm.vertical,
          IntrinsicWidth(
            child: ButtonWidget.primary(
              appColors: appColors,
              text: 'Adicionar',
              onPressed: _viewModel.goToAddAnnotation,
              leading: const Icon(Icons.add, size: 24.0),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimension.md.vertical,
          TextWidget.subtitle(
            'Minhas Anotações:',
            fontWeight: AppFontWeight.semiBold,
          ),
          Dimension.lg.vertical,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _viewModel.annotations.length,
            itemBuilder: (context, index) {
              final annotation = _viewModel.annotations[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  color: appColors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: appColors.neutral.c200),
                  boxShadow: [
                    BoxShadow(
                      color: appColors.neutral.c900.withValues(alpha: 0.04),
                      blurRadius: 14.0,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  title: TextWidget.subtitle(
                    annotation.title,
                    color: appColors.textPrimary,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextWidget.caption(
                      annotation.description,
                      color: appColors.textSecondary,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: annotation.id == null
                        ? null
                        : () => _confirmDeleteAnnotation(annotation),
                    icon: Icon(Icons.delete_outline, color: appColors.red.c500),
                  ),
                  onTap: () => _goToEditAnnotation(annotation),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
