import 'package:desafio_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool obscure;
  final bool required;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final FocusNode? focus;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool canRequestFocus;
  final VoidCallback? onTap;
  final bool enableObscureToggle;

  const TextFieldWidget._({
    super.key,
    this.controller,
    this.initialValue,
    this.autovalidateMode,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.enabled = true,
    this.obscure = false,
    this.required = false,
    this.validator,
    this.hintText,
    this.labelText,
    this.focus,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.canRequestFocus = true,
    this.onTap,
    this.enableObscureToggle = false,
  });

  factory TextFieldWidget.text({
    bool enabled = true,
    bool required = false,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
    String? initialValue,
    String? hintText,
    String? labelText,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    TextAlign textAlign = TextAlign.start,
    FocusNode? focus,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
    Color? suffixIconColor,
    BoxConstraints? suffixIconConstraints,
    Widget? prefixIcon,
    Color? prefixIconColor,
    BoxConstraints? prefixIconConstraints,
    int? maxLines = 1,
    int? maxLength,
    bool readOnly = false,
    bool canRequestFocus = true,
    VoidCallback? onTap,
    Key? key,
  }) => TextFieldWidget._(
    key: key,
    enabled: enabled,
    controller: controller,
    autovalidateMode: autovalidateMode,
    initialValue: initialValue,
    hintText: hintText,
    labelText: labelText,
    onChanged: onChanged,
    validator: validator,
    keyboardType: TextInputType.text,
    inputFormatters: inputFormatters,
    textAlign: textAlign,
    focus: focus,
    suffixIcon: suffixIcon,
    suffixIconColor: suffixIconColor,
    suffixIconConstraints: suffixIconConstraints,
    prefixIcon: prefixIcon,
    prefixIconColor: prefixIconColor,
    prefixIconConstraints: prefixIconConstraints,
    maxLines: maxLines,
    maxLength: maxLength,
    readOnly: readOnly,
    canRequestFocus: canRequestFocus,
    onTap: onTap,
  );

  factory TextFieldWidget.password({
    bool obscure = true,
    Color? suffixIconColor,
    BoxConstraints? suffixIconConstraints,
    bool enabled = true,
    bool required = false,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
    String? initialValue,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    String? hintText,
    String? labelText,
    FocusNode? focus,
    List<TextInputFormatter>? inputFormatters,
    Widget? prefixIcon,
    Color? prefixIconColor,
    BoxConstraints? prefixIconConstraints,
    int maxLines = 1,
    int? maxLength,
    bool readOnly = false,
    bool canRequestFocus = true,
    VoidCallback? onTap,
    Key? key,
  }) => TextFieldWidget._(
    key: key,
    enabled: enabled,
    required: required,
    obscure: obscure,
    hintText: hintText,
    labelText: labelText,
    controller: controller,
    autovalidateMode: autovalidateMode,
    initialValue: initialValue,
    onChanged: onChanged,
    validator: validator,
    keyboardType: TextInputType.text,
    inputFormatters: inputFormatters,
    focus: focus,
    textAlign: TextAlign.start,
    suffixIconColor: suffixIconColor,
    suffixIconConstraints: suffixIconConstraints,
    prefixIcon: prefixIcon,
    prefixIconColor: prefixIconColor,
    prefixIconConstraints: prefixIconConstraints,
    maxLines: maxLines,
    maxLength: maxLength,
    readOnly: readOnly,
    canRequestFocus: canRequestFocus,
    onTap: onTap,
    enableObscureToggle: true,
  );

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final suffixIcon = widget.enableObscureToggle
        ? IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          )
        : widget.suffixIcon;

    return Column(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty)
          RichTextRequiredWidget(
            text: widget.labelText!,
            required: widget.required,
          ),
        TextFormField(
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          canRequestFocus: widget.canRequestFocus,
          focusNode: widget.focus,
          controller: widget.controller,
          initialValue: widget.initialValue,
          autovalidateMode: widget.autovalidateMode,
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          enableInteractiveSelection: false,
          textCapitalization: TextCapitalization.none,
          cursorWidth: 1.0,
          cursorHeight: 16.0,
          cursorColor: appColors.textPrimary,
          onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: _obscureText,
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            suffixIcon: suffixIcon,
            suffixIconColor: widget.suffixIconColor ?? appColors.textSecondary,
            suffixIconConstraints: widget.suffixIconConstraints,
            prefixIcon: widget.prefixIcon,
            prefixIconColor: widget.prefixIconColor,
            prefixIconConstraints: widget.prefixIconConstraints,
          ),
        ),
      ],
    );
  }
}
