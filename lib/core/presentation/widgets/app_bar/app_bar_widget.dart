import 'package:flutter/material.dart';

import '../../../core.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool loading;
  final String title;
  final bool disabledLeading;
  final VoidCallback? onTap;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    this.loading = false,
    required this.title,
    this.disabledLeading = false,
    this.onTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !disabledLeading,
      leading: disabledLeading
          ? null
          : InkWell(
              onTap: onTap ?? Navigator.of(context).pop,
              child: const Icon(Icons.chevron_left),
            ),
      title: loading
          ? ShimmerWidget(child: Text('carregando...'))
          : Text(title),
      actions: actions,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
