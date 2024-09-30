import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      );

  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA70002,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      );

  static ButtonStyle get fillYellow => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow80001.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      );

  // Gradient button style
  static BoxDecoration get gradientGreenAToPrimaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [appTheme.greenA200, theme.colorScheme.primary],
        ),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL12Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [
            appTheme.greenA200.withOpacity(0.1),
            theme.colorScheme.primary.withOpacity(0.1)
          ],
        ),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL14Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA20011,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: const Offset(0, 0),
          ),
        ],
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [appTheme.greenA200, theme.colorScheme.primary],
        ),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL14AlternateDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: appTheme.cyan90033,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: const Offset(11, 28),
          ),
        ],
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [appTheme.greenA200, theme.colorScheme.primary],
        ),
      );

  static BoxDecoration get gradientGreenAToPrimaryTL16Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0),
          end: const Alignment(1.0, 1),
          colors: [
            appTheme.greenA200.withOpacity(0.1),
            theme.colorScheme.primary.withOpacity(0.1)
          ],
        ),
      );

  // Outline button style
  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA70001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        shadowColor: appTheme.black90001.withOpacity(0.13),
        elevation: 4,
      );

  static ButtonStyle get outlineIndigo => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        shadowColor: appTheme.indigoA20011,
        elevation: 0,
      );

  static ButtonStyle get outlineIndigoATL14 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA70001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        shadowColor: appTheme.indigoA20011,
        elevation: 26,
      );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.transparent),
        ),
      );
}
