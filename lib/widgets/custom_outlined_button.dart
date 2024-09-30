import 'package:flutter/material.dart';

import '../core/app_export.dart';
import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {
  const CustomOutlinedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.borderColor = Colors.black, // Default border color
    this.borderWidth = 2.0, // Default border width

    this.label,
    super.onPressed, // Custom parameter for onPressed
    super.buttonStyle, // Custom parameter for buttonStyle
    super.buttonTextStyle, // Custom parameter for buttonTextStyle
    super.isDisabled = null, // Custom parameter for isDisabled
    super.alignment, // Custom parameter for alignment
    super.height, // Custom parameter for height
    super.width, // Custom parameter for width
    super.margin, // Custom parameter for margin
    required super.text, // Custom required text parameter
  });
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;
  final Color borderColor; // Outline color
  final double borderWidth; // Outline width

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget,
          )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: height ?? 56.0,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          style: buttonStyle?.copyWith(
                side: WidgetStateProperty.all(
                    BorderSide(color: borderColor, width: borderWidth)),
              ) ??
              ButtonStyle(
                side: WidgetStateProperty.all(
                    BorderSide(color: borderColor, width: borderWidth)),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    CustomTextStyles.bodyMediumBentonSansMediumOnErrorContainer,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
