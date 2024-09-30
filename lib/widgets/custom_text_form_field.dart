import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineIndigo => OutlineInputBorder(
        borderRadius: BorderRadius.circular(22.0),
        borderSide: BorderSide(
          color: appTheme.indigoA20011,
          width: 1,
        ),
      );

  static OutlineInputBorder get fillYellow => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.0),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get outlineIndigoATL22 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(22.0),
        borderSide: BorderSide(
          color: appTheme.indigoA20011.withOpacity(0.1),
          width: 1,
        ),
      );

  static OutlineInputBorder get outlineGrayTL14 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.0),
        borderSide: BorderSide(
          color: appTheme.gray20001,
          width: 1,
        ),
      );
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  });
  final String? onChanged;
  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus,
          style: textStyle ??
              CustomTextStyles.bodySmallBentonSansMediumDeeporange700,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: () {
            onTap?.call();
          },
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(14.0),
        fillColor: fillColor ?? appTheme.whiteA70001,
        filled: filled,
        border: borderDecoration ?? _defaultBorder,
        enabledBorder: borderDecoration ?? _defaultBorder,
        focusedBorder: borderDecoration?.copyWith(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ) ??
            _defaultBorder.copyWith(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
      );

  InputBorder get _defaultBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.0),
        borderSide: BorderSide(
          color: appTheme.gray10001,
          width: 1,
        ),
      );

  InputBorder get _errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.0),
        borderSide: const BorderSide(
          color: Colors.red, // Color for error border
          width: 1,
        ),
      );
}
