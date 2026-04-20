import 'package:desafio_flutter/core/presentation/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

enum DialogVariant { base, warning, destructive }

class DialogWidget extends StatelessWidget {
  final DialogVariant variant;
  final String title;
  final String message;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? icon;
  final String? primaryText;
  final VoidCallback? primaryAction;
  final String? secondaryText;
  final VoidCallback? secondaryAction;
  final TextAlign? messageAlign;

  const DialogWidget._({
    required this.variant,
    required this.title,
    required this.message,
    required this.primaryText,
    required this.primaryAction,
    required this.crossAxisAlignment,
    this.icon,
    this.secondaryText,
    this.secondaryAction,
    this.messageAlign,
  });

  factory DialogWidget.base({
    required String title,
    required String message,
    String? primaryText,
    VoidCallback? primaryAction,
    String? secondaryText,
    VoidCallback? secondaryAction,
    TextAlign? messageAlign,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return DialogWidget._(
      variant: DialogVariant.base,
      title: title,
      message: message,
      primaryText: primaryText,
      primaryAction: primaryAction,
      secondaryText: secondaryText,
      secondaryAction: secondaryAction,
      crossAxisAlignment: crossAxisAlignment,
      messageAlign: messageAlign,
    );
  }

  factory DialogWidget.warning({
    required String title,
    required String message,
    String? primaryText,
    VoidCallback? primaryAction,
    String? secondaryText,
    VoidCallback? secondaryAction,
    TextAlign? messageAlign,
  }) {
    return DialogWidget._(
      variant: DialogVariant.warning,
      title: title,
      message: message,
      primaryText: primaryText,
      primaryAction: primaryAction,
      secondaryText: secondaryText,
      secondaryAction: secondaryAction,
      crossAxisAlignment: CrossAxisAlignment.center,
      icon: const Icon(Icons.error_rounded, size: 34.0),
      messageAlign: messageAlign,
    );
  }

  factory DialogWidget.destructive({
    required String title,
    required String message,
    String? primaryText,
    VoidCallback? primaryAction,
    String? secondaryText,
    VoidCallback? secondaryAction,
    TextAlign? messageAlign,
  }) => DialogWidget._(
    variant: DialogVariant.destructive,
    title: title,
    message: message,
    primaryText: primaryText,
    primaryAction: primaryAction,
    secondaryText: secondaryText,
    secondaryAction: secondaryAction,
    crossAxisAlignment: CrossAxisAlignment.center,
    icon: const Icon(Icons.do_not_disturb_on_rounded, size: 34.0),
    messageAlign: messageAlign,
  );

  Future<void> show(BuildContext context, {bool barrierDismissible = false}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => this,
    );
  }

  Color iconColor(AppColors appColors) {
    switch (variant) {
      case DialogVariant.warning:
        return appColors.amber.c500;
      case DialogVariant.destructive:
        return appColors.red.c500;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColors;
    final color = iconColor(context.appColors);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            if (icon != null) ...[
              IconTheme(
                data: IconThemeData(color: color),
                child: icon!,
              ),
              Dimension.xs.vertical,
            ],
            TextWidget.title(title, color: appColor.neutral.c900),
            Dimension.xs.vertical,
            TextWidget.subtitle(message, color: appColor.neutral.c700),
            Dimension.md.vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8.0,
              children: [
                if (secondaryText != null && secondaryAction != null)
                  TextButtonWidget.regular(
                    text: secondaryText!,
                    onPressed: secondaryAction,
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  ),
                if (primaryText != null && primaryAction != null)
                  TextButtonWidget.regular(
                    text: primaryText!,
                    onPressed: primaryAction,
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
