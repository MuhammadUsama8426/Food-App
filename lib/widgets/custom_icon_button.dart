import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001.withOpacity(0.53),
        borderRadius: BorderRadius.circular(14.0),
      );

  static BoxDecoration get gradientGreenAToPrimary => BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [
            appTheme.greenA200.withOpacity(0.39),
            theme.colorScheme.primary.withOpacity(0.39),
          ],
        ),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL38 => BoxDecoration(
        borderRadius: BorderRadius.circular(38.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [
            appTheme.greenA200.withOpacity(0.1),
            theme.colorScheme.primary.withOpacity(0.1),
          ],
        ),
      );

  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA20001,
        borderRadius: BorderRadius.circular(38.0),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL16 => BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [
            appTheme.greenA200.withOpacity(0.39),
            theme.colorScheme.primary.withOpacity(0.39),
          ],
        ),
      );

  static BoxDecoration get fillRedATL16 => BoxDecoration(
        color: appTheme.redA400.withOpacity(0.39),
        borderRadius: BorderRadius.circular(16.0),
      );
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  });

  final Alignment? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: appTheme.orangeA200.withOpacity(0.39),
                borderRadius: BorderRadius.circular(14.0),
              ),
          child: IconButton(
            padding: padding ?? EdgeInsets.zero,
            onPressed: onTap,
            icon: child ?? Container(),
          ),
        ),
      );
}
