import 'package:flutter/material.dart';

import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> get _supportedCustomColor =>
      {"lightCode": LightCodeColors()};

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    "lightCode": ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the light code colors for the current theme
  LightCodeColors _getthemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme
          .whiteA70002, // Assuming themeColors is a method returning LightCodeColors
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme
                .gray10001, // Assuming themeColors is a method returning LightCodeColors
            width: 1,
          ),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 5,
        space: 5,
        color: appTheme
            .lime50, // Assuming themeColors is a method returning LightCodeColors
      ),
    );
  }

  LightCodeColors themeColor() => _getthemeColors();

  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      bodyLarge: TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 16,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: appTheme.gray80002.withOpacity(0.3),
        fontSize: 14,
        fontFamily: 'BentonSans Regular',
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 9,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: appTheme.greenA200,
        fontSize: 40,
        fontFamily: 'Viga',
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: appTheme.black900,
        fontSize: 31,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: colorScheme.onErrorContainer,
        fontSize: 27,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: appTheme.black900,
        fontSize: 25,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: colorScheme.onErrorContainer,
        fontSize: 13,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: appTheme.yellow80001,
        fontSize: 22,
        fontFamily: 'BentonSans Bold',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF14BE77),
    primaryContainer: Color(0xFFFAD15F),
    secondaryContainer: Color(0xFFE8761F),
    errorContainer: Color(0xFFBE4C1B),
    onError: Color(0xFF32BA7C),
    onErrorContainer: Color(0xFF09051C),
    onPrimary: Color(0xB2181818),
    onPrimaryContainer: Color(0x0ffad15f),
  );
}

/// Class containing custom colors for a light code theme.
class LightCodeColors {
  // Amber
  Color get amber100 => const Color(0xFFFDE5C1);
  Color get amber300 => const Color(0xFFF2CC49);
  Color get amber30001 => const Color(0xFFFFCC66);
  Color get amber30002 => const Color(0xFFFFE140);
  Color get amber500 => const Color(0xFFFFC107);
  Color get amber700 => const Color(0xFFE9A000);
  Color get amberA100 => const Color(0xFFFFE580);
  Color get amberA200 => const Color(0xFFFFDD40);
  Color get amberA20001 => const Color(0xFFFBD246);
  Color get amberA400 => const Color(0xFFFFCC00);
  Color get amberA700 => const Color(0xFFEFA708);

  // Black
  Color get black900 => const Color(0xFF090418);
  Color get black90001 => const Color(0xFF000000);

  // Blue
  Color get blue100 => const Color(0xFFD3DCFB);
  Color get blue800 => const Color(0xFF2566AF);

  // BlueGray
  Color get blueGray100 => const Color(0xFFD90909);
  Color get blueGray200 => const Color(0xFFB0BEC5);
  Color get blueGray400 => const Color(0xFF8F838D);
  Color get blueGray50 => const Color(0xFFECEFF1);

  // Cyan
  Color get cyan90033 => const Color(0x33134D5A);

  // DeepOrange
  Color get deepOrange100 => const Color(0xFFFFBFBF);
  Color get deepOrange200 => const Color(0xFFE2B58B);
  Color get deepOrange300 => const Color(0xFFFF7E70);
  Color get deepOrange400 => const Color(0xFFFE823C);
  Color get deepOrange40001 => const Color(0xFFD98843);
  Color get deepOrange40002 => const Color(0xFFD48745);
  Color get deepOrange50 => const Color(0xFFF2EBE5);
  Color get deepOrange5001 => const Color(0xFFF1EAE2);
  Color get deepOrange700 => const Color(0xFFDA6317);
  Color get deepOrange800 => const Color(0xFFBE582A);
  Color get deepOrange900 => const Color(0xFFA24827);
  Color get deepOrange90001 => const Color(0xFF8C3A12);
  Color get deepOrange90002 => const Color(0xFFAE4D25);
  Color get deepOrange90003 => const Color(0xFFB55728);
  Color get deepOrange90004 => const Color(0xFFA73022);
  Color get deepOrange90005 => const Color(0xFF8D3800);
  Color get deepOrange90006 => const Color(0xFFCD4200);
  Color get deepOrange90007 => const Color(0xFF993A12);
  Color get deepOrange90008 => const Color(0xFF8F3300);
  Color get deepOrangeA200 => const Color(0xFFFF7B32);
  Color get deepOrangeA400 => const Color(0xFFFF4600);
  Color get deepOrangeA700 => const Color(0xFFC40606);

  // Gray
  Color get gray100 => const Color(0xFFF6F6F6);
  Color get gray10001 => const Color(0xFFF4F4F4);
  Color get gray10002 => const Color(0xFFF2F2F2);
  Color get gray200 => const Color(0xFFEFEFEC);
  Color get gray20001 => const Color(0xFFE7E7E7);
  Color get gray300 => const Color(0xFFF0E1DD);
  Color get gray30001 => const Color(0xFFEAE6DC);
  Color get gray30002 => const Color(0xFFDEDEDE);
  Color get gray30003 => const Color(0xFFEBE5DF);
  Color get gray400 => const Color(0xFFBEBEBE);
  Color get gray40001 => const Color(0xFFC7CBC9);
  Color get gray40002 => const Color(0xFFCCB181);
  Color get gray40003 => const Color(0xFFC4C4C4);
  Color get gray40004 => const Color(0xFFD6C2A6);
  Color get gray50 => const Color(0xFFF6FAFE);
  Color get gray500 => const Color(0xFFA1A8A6);
  Color get gray50001 => const Color(0xFFB28784);
  Color get gray5001 => const Color(0xFFFFF2FB);
  Color get gray600 => const Color(0xFF828282);
  Color get gray700 => const Color(0xFF9B9B9B);
  Color get gray70001 => const Color(0xFF8F4B46);
  Color get gray70002 => const Color(0xFF8F524D);
  Color get gray70003 => const Color(0xFF6B3A5B);
  Color get gray70004 => const Color(0xFF716361);
  Color get gray70005 => const Color(0xFF8C466A);

  Color get gray800 => const Color(0xFF6C6C6C);
  Color get gray80001 => const Color(0xFF6A6A6A);
  Color get gray80002 => const Color(0xFF5F5F5F);
  Color get gray900 => const Color(0xFF1C1C1C);
  Color get gray90001 => const Color(0xFF333333);

  // Green
  Color get green100 => const Color(0xFFDAF2E4);
  Color get green200 => const Color(0xFF92E5AE);
  Color get green300 => const Color(0xFF76E0A5);
  Color get green400 => const Color(0xFF43BD8A);
  Color get greenA100 => const Color(0xFFC8E6C9);
  Color get greenA200 => const Color(0xFF81C784);
  Color get greenA400 => const Color(0xFF66BB6A);
  Color get greenA700 => const Color(0xFF4CAF50);

  // Indigo
  Color get indigo600 => const Color(0xFF3C5A9A);
  Color get indigo800 => const Color(0xFF253880);
  Color get indigo900 => const Color(0xFF222065);
  Color get indigoA20011 => const Color(0x115A6CEA);

  // Light Blue
  Color get lightBlue600 => const Color(0xFF179BD7);

  // Light Green
  Color get lightGreen200 => const Color(0xFFDBC980);
  Color get lightGreen500 => const Color(0xFF97DE3D);
  Color get lightGreen600 => const Color(0xFF788027);
  Color get lightGreen700 => const Color(0xFF73A624);

  // Lime
  Color get lime100 => const Color(0xFFE9F7BA);
  Color get lime50 => const Color(0xFFFEF6ED);
  Color get lime700 => const Color(0xFFB09749);
  Color get lime70001 => const Color(0xFF9FCC29);
  Color get lime800 => const Color(0xFFBA7730);
  Color get lime80001 => const Color(0xFFBE7139);
  Color get lime900 => const Color(0xFF9E5838);
  Color get lime90001 => const Color(0xFF8B4B3A);

  // Orange
  Color get orange100 => const Color(0xFFEAD4AF);
  Color get orange200 => const Color(0xFFE68970);
  Color get orange300 => const Color(0xFFE58348);
  Color get orange30001 => const Color(0xFFE3AB5C);
  Color get orange400 => const Color(0xFFFF9433);
  Color get orange700 => const Color(0xFFD68902);
  Color get orangeA100 => const Color(0xFFFB0198);
  Color get orangeA200 => const Color(0xFFF9A840);
  Color get orangeA20001 => const Color(0xFFEE9843);
  Color get orangeA20002 => const Color(0xFFF89945);
  Color get orangeA20003 => const Color(0xFFE6A540);
  Color get orangeA20004 => const Color(0xFFE09945);

  // Pink
  Color get pink200 => const Color(0xFFFF8FB8);
  Color get pink300 => const Color(0xFFFF5F96);
  Color get pink50 => const Color(0xFFFFDFEA);

  // Red
  Color get red300 => const Color(0xFFB9866E);
  Color get red30001 => const Color(0xFFB27860);
  Color get red30002 => const Color(0xFFC47F4C);
  Color get red400 => const Color(0xFFBA5F49);
  Color get red40001 => const Color(0xFFD56C48);
  Color get red500 => const Color(0xFFFF3333);
  Color get red50001 => const Color(0xFFEB4335);
  Color get red600 => const Color(0xFFEA3333);
  Color get red700 => const Color(0xFFCC3131);
  Color get red70001 => const Color(0xFFE21818);
  Color get red70002 => const Color(0xFFB1523A);
  Color get red70003 => const Color(0xFFE72124);
  Color get red800 => const Color(0xFFC42124);
  Color get red80001 => const Color(0xFFC91D1D);
  Color get red80002 => const Color(0xFFD12424);
  Color get red80003 => const Color(0xFFA75640);
  Color get red900 => const Color(0xFF822A00);
  Color get red90001 => const Color(0xFF792C12);
  Color get red90002 => const Color(0xFF953E25);
  Color get redA200 => const Color(0xFFFF4545);
  Color get redA20001 => const Color(0xFFFF4A4A);
  Color get redA20002 => const Color(0xFFFF4155);
  Color get redA400 => const Color(0xFFFFC1C1);
  Color get redA700 => const Color(0xFFC40606);

  // Teal
  Color get teal200 => const Color(0xFF6BC3C3);
  Color get teal300 => const Color(0xFF3FDA85);
  Color get teal400 => const Color(0xFF2ECF80);
  Color get teal600 => const Color(0xFF0AA06E);
  Color get teal700 => const Color(0xFF009C51);

  // White
  Color get whiteA700 => const Color(0xFFFAFDFF);
  Color get whiteA70001 => const Color(0xFFFFFFFF);
  Color get whiteA70002 => const Color(0xFFFEFEFF);

  // Yellow
  Color get yellow300 => const Color(0xFFFBDF69);
  Color get yellow30001 => const Color(0xFFFBDF6A);
  Color get yellow600 => const Color(0xFFF7D52A);
  Color get yellow700 => const Color(0xFFF9C22D);
  Color get yellow70001 => const Color(0xFFFFBB33);
  Color get yellow70002 => const Color(0xFFFFB332);
  Color get yellow70003 => const Color(0xFFFFC839);
  Color get yellow800 => const Color(0xFFD2923D);
  Color get yellow80001 => const Color(0xFFFEAD1D);
  Color get yellow900 => const Color(0xFFD77124);
  Color get yellow90001 => const Color(0xFFE76C27);
  Color get yellow90002 => const Color(0xFFE68A2E);
  Color get yellowA700 => const Color(0xFFFFCF08);
}
