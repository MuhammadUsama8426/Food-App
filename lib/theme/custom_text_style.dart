import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get bentonSansRegular => copyWith(
        fontFamily: 'BentonSans Regular',
      );

  TextStyle get bentonSansBook => copyWith(
        fontFamily: 'BentonSans Book',
      );

  TextStyle get roboto => copyWith(
        fontFamily: 'Roboto',
      );

  TextStyle get manrope => copyWith(
        fontFamily: 'Manrope',
      );

  TextStyle get rubik => copyWith(
        fontFamily: 'Rubik',
      );

  TextStyle get bentonSansMedium => copyWith(
        fontFamily: 'BentonSans Medium',
      );

  TextStyle get inter => copyWith(
        fontFamily: 'Inter',
      );

  TextStyle get poppins => copyWith(
        fontFamily: 'Poppins',
      );

  TextStyle get bentonSansBold => copyWith(
        fontFamily: 'BentonSans Bold',
      );

  TextStyle get viga => copyWith(
        fontFamily: 'Viga',
      );
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLarge17 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 17.0,
      );

  static TextStyle get bodyLargeBentonSansMediumGray400 =>
      theme.textTheme.bodyLarge!.bentonSansMedium.copyWith(
        color: appTheme.gray400,
        fontSize: 19.0,
      );

  static TextStyle get bodyLargeBentonSansMediumGreenA200 =>
      theme.textTheme.bodyLarge!.bentonSansMedium.copyWith(
        color: appTheme.greenA200,
        fontSize: 19.0,
      );

  static TextStyle get bodyLargeBentonSansRegularGray600 =>
      theme.textTheme.bodyLarge!.bentonSansRegular.copyWith(
        color: appTheme.gray600,
      );

  static TextStyle get bodyLargeBentonSansRegularGray80002 =>
      theme.textTheme.bodyLarge!.bentonSansRegular.copyWith(
        color: appTheme.gray80002.withOpacity(0.3),
        fontSize: 19.0,
      );

  static TextStyle get bodyLargeBlack90001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyLargeGray70003 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray70003,
        fontSize: 17.0,
      );

  static TextStyle get bodyLargeGreenA200 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.greenA200,
        fontSize: 19.0,
      );

  static TextStyle get bodyLargeManropeOnErrorContainer =>
      theme.textTheme.bodyLarge!.manrope.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );

  static TextStyle get bodyLargePoppinsOnPrimary =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get bodyLargeWhiteA70002 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 18.0,
      );

  static TextStyle get bodyMediumBentonSansBoldBlack900 =>
      theme.textTheme.bodyMedium!.bentonSansBold.copyWith(
        color: appTheme.black900,
        fontSize: 15.0,
      );

  static TextStyle get bodyMediumBentonSansBoldBlack90001 =>
      theme.textTheme.bodyMedium!.bentonSansBold.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyMediumBentonSansBoldGreenA200 =>
      theme.textTheme.bodyMedium!.bentonSansBold.copyWith(
        color: appTheme.greenA200,
      );

  static TextStyle get bodyMediumBentonSansBoldWhiteA70002 =>
      theme.textTheme.bodyMedium!.bentonSansBold.copyWith(
        color: appTheme.whiteA70002,
      );

  static TextStyle get bodyMediumBentonSansBookBlack90001 =>
      theme.textTheme.bodyMedium!.bentonSansBook.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
        fontSize: 13.0,
      );

  static TextStyle get bodyMediumBentonSansBookOnPrimary =>
      theme.textTheme.bodyMedium!.bentonSansBook.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.8),
      );

  static TextStyle get bodyMediumBentonSansBookWhiteA70001 =>
      theme.textTheme.bodyMedium!.bentonSansBook.copyWith(
        color: appTheme.whiteA70001.withOpacity(0.8),
      );

  static TextStyle get bodyMediumBentonSansMediumBlack900 =>
      theme.textTheme.bodyMedium!.bentonSansMedium.copyWith(
        color: appTheme.black900,
        fontSize: 15.0,
      );

  static TextStyle get bodyMediumBentonSansMediumOnErrorContainer =>
      theme.textTheme.bodyMedium!.bentonSansMedium.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );

  static TextStyle get bodyMediumBentonSansMediumWhiteA70002 =>
      theme.textTheme.bodyMedium!.bentonSansMedium.copyWith(
        color: appTheme.whiteA70002,
      );

  static TextStyle get bodyMediumGray80002 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray80002,
      );

  static TextStyle get bodyMediumGreenA200 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.greenA200,
      );

  static TextStyle get bodyMediumRubikGray50 =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: appTheme.gray50,
      );

  static TextStyle get bodyMediumRubikOnErrorContainer =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );

  static TextStyle get bodyMediumRubikOnPrimary =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.8),
      );

  static TextStyle get bodySmallBentonSansBookBlack90001 =>
      theme.textTheme.bodySmall!.bentonSansBook.copyWith(
        color: appTheme.black90001.withOpacity(0.5),
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansBookBlack9000112 =>
      theme.textTheme.bodySmall!.bentonSansBook.copyWith(
        color: appTheme.black90001,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansBookDeeporangeA200 =>
      theme.textTheme.bodySmall!.bentonSansBook.copyWith(
        color: appTheme.deepOrangeA200,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansMedium =>
      theme.textTheme.bodySmall!.bentonSansMedium.copyWith(
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansMediumDeeporange700 =>
      theme.textTheme.bodySmall!.bentonSansMedium.copyWith(
        color: appTheme.deepOrange700,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansMediumGreenA200 =>
      theme.textTheme.bodySmall!.bentonSansMedium.copyWith(
        color: appTheme.greenA200,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansMediumOnErrorContainer =>
      theme.textTheme.bodySmall!.bentonSansMedium.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallBentonSansMediumYellow80001 =>
      theme.textTheme.bodySmall!.bentonSansMedium.copyWith(
        color: appTheme.yellow80001,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallGray70003 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray70003,
        fontSize: 10.0,
      );

  static TextStyle get bodySmallGreenA200 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.greenA200,
        fontSize: 10.0,
      );

  static TextStyle get bodySmallOnErrorContainer =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 12.0,
      );

  static TextStyle get bodySmallRobotoDeeporange700 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.deepOrange700.withOpacity(0.4),
        fontSize: 12.0,
      );

  static TextStyle get bodySmallTeal700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal700,
        fontSize: 10.0,
      );

  // Headline text style
  static TextStyle get headlineLargeGreenA200 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.greenA200,
        fontSize: 30.0,
      );

  // Title text style
  static TextStyle get titleLargeBlack900 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 20.0,
      );

  static TextStyle get titleLargeBlack90023 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 23.0,
      );

  static TextStyle get titleLargeBlack900_1 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
}
