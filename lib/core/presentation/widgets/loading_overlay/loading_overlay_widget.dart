import 'package:flutter/material.dart';

import '../../../core.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool visible;
  final String title;
  final String? subtitle;

  const LoadingOverlayWidget({
    super.key,
    required this.visible,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 180),
        opacity: visible ? 1 : 0,
        child: ColoredBox(
          color: appColors.background.withValues(alpha: 0.72),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 280),
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 24.0,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 28.0,
                    height: 28.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.8,
                      color: appColors.blue.c500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextWidget.title(
                    title,
                    color: appColors.textPrimary,
                    textAlign: TextAlign.center,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
                    const SizedBox(height: 8.0),
                    TextWidget.caption(
                      subtitle!,
                      color: appColors.textSecondary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
