import 'package:flutter/material.dart';

import '../../../core.dart';

enum SnackBarVariant {
  success,
  error,
  warning,
  other;

  const SnackBarVariant();

  Color background(AppColors appColors) {
    switch (this) {
      case success:
        return appColors.green.c600;
      case error:
        return appColors.red.c600;
      case warning:
        return appColors.amber.c600;
      case other:
        return appColors.zinc.c900;
    }
  }
}

class SnackBarWidget extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final String? textAction;
  final VoidCallback? action;

  const SnackBarWidget._({
    required this.message,
    required this.backgroundColor,
    this.textAction,
    this.action,
  });

  @override
  State<SnackBarWidget> createState() => _SnackBarWidgetState();

  factory SnackBarWidget.error(AppColors appColors, String message) =>
      SnackBarWidget._(
        message: message,
        backgroundColor: SnackBarVariant.error.background(appColors),
      );

  factory SnackBarWidget.success(AppColors appColors, String message) =>
      SnackBarWidget._(
        message: message,
        backgroundColor: SnackBarVariant.success.background(appColors),
      );

  static showError(
    BuildContext context,
    String message, {
    String? textAction,
    VoidCallback? action,
    Duration? duration,
    double? paddingBottom,
  }) => _show(
    context,
    SnackBarVariant.error,
    message,
    textAction: textAction,
    action: action,
    duration: duration,
    paddingBottom: paddingBottom,
  );

  static showSuccess(
    BuildContext context,
    String message, {
    String? textAction,
    VoidCallback? action,
    Duration? duration,
    double? paddingBottom,
  }) => _show(
    context,
    SnackBarVariant.success,
    message,
    textAction: textAction,
    action: action,
    duration: duration,
    paddingBottom: paddingBottom,
  );

  static showOther(
    BuildContext context,
    String message, {
    String? textAction,
    VoidCallback? action,
    Duration? duration,
    double? paddingBottom,
  }) => _show(
    context,
    SnackBarVariant.other,
    message,
    textAction: textAction,
    action: action,
    duration: duration,
    paddingBottom: paddingBottom,
  );

  static showWarning(
    BuildContext context,
    String message, {
    String? textAction,
    VoidCallback? action,
    Duration? duration,
    double? paddingBottom,
  }) => _show(
    context,
    SnackBarVariant.warning,
    message,
    textAction: textAction,
    action: action,
    duration: duration,
    paddingBottom: paddingBottom,
  );

  static _show(
    BuildContext context,
    SnackBarVariant snackBarVariant,
    String message, {
    String? textAction,
    VoidCallback? action,
    Duration? duration,
    double? paddingBottom,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 5),
        padding: EdgeInsets.zero,
        margin: EdgeInsetsGeometry.only(
          right: Dimension.sm.value,
          left: Dimension.sm.value,
          bottom:
              paddingBottom ??
              MediaQuery.of(context).padding.bottom + Dimension.md.value,
        ),
        content: SnackBarWidget._(
          message: message,
          backgroundColor: snackBarVariant.background(context.appColors),
          textAction: textAction,
          action: action,
        ),
      ),
    );
  }
}

class _SnackBarWidgetState extends State<SnackBarWidget> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textAction = widget.textAction;
    final action = widget.action;

    return Container(
      padding: EdgeInsets.all(Dimension.sm.value),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.xxs.value),
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: appColors.neutral.c900.withValues(alpha: .3),
            offset: const Offset(0.0, 1.0),
            blurRadius: 3.0,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: appColors.neutral.c900.withValues(alpha: .15),
            blurRadius: 8.0,
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextWidget.base(widget.message, color: appColors.white),
          ),
          if (textAction != null && action != null)
            Padding(
              padding: EdgeInsets.only(left: Dimension.xxs.value),
              child: InkWell(
                onTap: action,
                child: TextWidget.base(textAction, color: appColors.white),
              ),
            ),
        ],
      ),
    );
  }
}
