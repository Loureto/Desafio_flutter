import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ContentWrapperWidget extends StatelessWidget {
  final Widget? child;

  const ContentWrapperWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.sm.value,
        vertical: Dimension.lg.value,
      ),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: child,
    );
  }
}
