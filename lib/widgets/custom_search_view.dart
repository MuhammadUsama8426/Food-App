import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.margin, // New margin parameter
    this.borderRadius = 22.0, // New border radius parameter
    this.borderColor, // New border color parameter
  });

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final EdgeInsets? margin; // New margin parameter
  final double borderRadius; // New border radius parameter
  final Color? borderColor; // New border color parameter

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchBarWidget(context),
          )
        : searchBarWidget(context);
  }

  Widget searchBarWidget(BuildContext context) {
    return Container(
      margin: margin, // Use the margin parameter
      width: width ?? double.infinity,
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
        style: textStyle ?? CustomTextStyles.bodySmallRobotoDeeporange700,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
        onChanged: (String value) => onChanged?.call(value),
      ),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ?? CustomTextStyles.bodySmallRobotoDeeporange700,
      prefixIcon: prefix ??
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconSearch,
              height: 24.0,
              width: 24.0,
            ),
          ),
      prefixIconConstraints:
          prefixConstraints ?? const BoxConstraints(maxHeight: 50.0),
      suffixIcon: suffix ??
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () => controller?.clear(),
              icon: Icon(
                Icons.clear,
                color: Colors.grey.shade600,
              ),
            ),
          ),
      suffixIconConstraints:
          suffixConstraints ?? const BoxConstraints(maxHeight: 50.0),
      isDense: true,
      contentPadding: contentPadding ?? const EdgeInsets.all(12.0),
      fillColor: fillColor ?? appTheme.orangeA200.withOpacity(0.1),
      filled: filled,
      border: _inputBorder(), // Set the input border here
      enabledBorder:
          _inputBorder(), // Use the same input border for enabled state
      focusedBorder: _inputBorder().copyWith(
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: borderColor ??
            appTheme.indigoA20011, // Use the passed border color or default
        width: 1,
      ),
    );
  }
}
