import 'package:flutter/material.dart';

import '../../../core.dart';

enum ButtonSize { small, medium, large }

enum ButtonVariant { primary, secondary }

extension ButtonSizeExtension on ButtonSize {
  double get height => switch (this) {
    ButtonSize.small => 28.0,
    ButtonSize.medium => 32.0,
    ButtonSize.large => 48.0,
  };

  double get loaderSize => switch (this) {
    ButtonSize.small => 14.0,
    ButtonSize.medium => 16.0,
    ButtonSize.large => 20.0,
  };

  EdgeInsets get padding => switch (this) {
    ButtonSize.small => const EdgeInsets.symmetric(horizontal: 10.0),
    ButtonSize.medium ||
    ButtonSize.large => const EdgeInsets.symmetric(horizontal: 16.0),
  };
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final ButtonVariant variant;
  final ButtonStyle style;
  final VoidCallback? onPressed;

  final bool loading;

  final Widget? leading;
  final Widget? trailing;

  final ButtonSize size;

  const ButtonWidget._({
    required this.text,
    required this.variant,
    required this.style,
    this.onPressed,
    this.loading = false,
    this.leading,
    this.trailing,
    this.size = ButtonSize.large,
    super.key,
  });

  factory ButtonWidget.primary({
    required AppColors appColors,
    required String text,
    VoidCallback? onPressed,
    bool loading = false,
    Widget? leading,
    Widget? trailing,
    ButtonSize size = ButtonSize.large,
    Key? key,
  }) => ButtonWidget._(
    key: key,
    text: text,
    variant: ButtonVariant.primary,
    onPressed: onPressed,
    loading: loading,
    leading: leading,
    trailing: trailing,
    size: size,
    style: _buildStyle(
      variant: ButtonVariant.primary,
      appColors: appColors,
      loading: loading,
    ),
  );

  factory ButtonWidget.secondary({
    required AppColors appColors,
    required String text,
    VoidCallback? onPressed,
    bool loading = false,
    Widget? leading,
    Widget? trailing,
    ButtonSize size = ButtonSize.large,
    Key? key,
  }) => ButtonWidget._(
    key: key,
    text: text,
    variant: ButtonVariant.secondary,
    onPressed: onPressed,
    loading: loading,
    leading: leading,
    trailing: trailing,
    size: size,
    style: _buildStyle(
      variant: ButtonVariant.secondary,
      appColors: appColors,
      loading: loading,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final foregroundColor = switch (variant) {
      ButtonVariant.primary => Colors.white,
      ButtonVariant.secondary =>
        style.foregroundColor?.resolve(<WidgetState>{}) ?? Colors.black,
    };

    final button = ElevatedButton(
      style: style.copyWith(
        padding: WidgetStatePropertyAll(size.padding),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll<Size>(Size(0, size.height)),
      ),
      onPressed: loading ? null : onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: loading ? 0 : 1,
            child: Row(
              spacing: Dimension.xxs.value,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                _buildLabel(text: text, size: size, color: foregroundColor),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          if (loading)
            SizedBox(
              width: size.loaderSize,
              height: size.loaderSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foregroundColor,
              ),
            ),
        ],
      ),
    );

    if (size == ButtonSize.large) {
      return SizedBox(
        width: double.infinity,
        height: size.height,
        child: button,
      );
    }

    return UnconstrainedBox(child: button);
  }

  static ButtonStyle _buildStyle({
    required ButtonVariant variant,
    required AppColors appColors,
    required bool loading,
  }) {
    return switch (variant) {
      ButtonVariant.primary => ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: appColors.blue.c500,
        foregroundColor: appColors.white,
        disabledBackgroundColor: appColors.blue.c300,
        disabledForegroundColor: appColors.white.withValues(alpha: 0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      ButtonVariant.secondary => ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: appColors.white,
        foregroundColor: appColors.blue.c500,
        disabledBackgroundColor: appColors.neutral.c100,
        disabledForegroundColor: appColors.blue.c300,
        side: BorderSide(
          color: loading ? appColors.blue.c300 : appColors.blue.c500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    };
  }

  Widget _buildLabel({
    required String text,
    required ButtonSize size,
    required Color color,
  }) {
    return TextWidget.button(
      text,
      color: color,
      fontWeight: AppFontWeight.regular,
    );
  }
}
