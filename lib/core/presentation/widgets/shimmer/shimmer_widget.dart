import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  final bool loading;

  const ShimmerWidget({required this.child, this.loading = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (!loading) return child;

    final appColors = context.appColors;

    return Shimmer.fromColors(
      baseColor: appColors.zinc.c50,
      highlightColor: appColors.zinc.c200,
      child: child,
    );
  }
}
