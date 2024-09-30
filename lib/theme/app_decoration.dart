import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGrayBoxDecoration => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillLimeBoxDecoration => BoxDecoration(
        color: appTheme.lime100,
      );

  static BoxDecoration get fillWhiteABoxDecoration => BoxDecoration(
        color: appTheme.whiteA70001,
      );

  static BoxDecoration get fillWhiteA70002BoxDecoration => BoxDecoration(
        color: appTheme.whiteA70002,
      );

  static BoxDecoration get fillYellowBoxDecoration => BoxDecoration(
        color: appTheme.yellow80001,
      );

  // Gradient decorations
  static BoxDecoration get gradientGreenAToPrimaryBoxDecoration =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0, -0.06),
          end: const Alignment(1, 1.11),
          colors: [appTheme.greenA200, theme.colorScheme.primary],
        ),
      );

  // Linear decorations
  static BoxDecoration get linearBoxDecoration => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0, -0.06),
          end: const Alignment(1, 1.11),
          colors: [appTheme.greenA200, theme.colorScheme.primary],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBoxDecoration => BoxDecoration(
        color: appTheme.whiteA70001,
      );

  static BoxDecoration get outlineIndigoABoxDecoration => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA20011,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: const Offset(0, 1),
          ),
        ],
      );

  static BoxDecoration get outlineIndigoA20011BoxDecoration => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA20011,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: const Offset(12, 26),
          ),
        ],
      );

  static BoxDecoration get outlineWhiteABoxDecoration => BoxDecoration(
        color: appTheme.redA20001,
        border: Border.all(
          color: appTheme.whiteA70001,
          width: 1.0,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder => BorderRadius.circular(8.0);

  static BorderRadius get circleBorder80 => BorderRadius.circular(80.0);

  // Custom borders
  static BorderRadius get customBorderTL54 => const BorderRadius.only(
        topLeft: Radius.circular(54.0),
        topRight: Radius.circular(40.0),
      );

  static BorderRadius get customBorderTL72 => const BorderRadius.only(
        topLeft: Radius.circular(72.0),
        topRight: Radius.circular(40.0),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(12.0);

  static BorderRadius get roundedBorder16 => BorderRadius.circular(16.0);

  static BorderRadius get roundedBorder22 => BorderRadius.circular(22.0);

  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.0);

  static BorderRadius get roundedBorder66 => BorderRadius.circular(66.0);

  static BorderRadius get roundedBorder94 => BorderRadius.circular(94.0);
}
