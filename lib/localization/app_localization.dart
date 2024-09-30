import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../core/app_export.dart'; // Assuming this path is correct for app export
import 'en_us/en_us_translation.dart'; // Import the English translation map

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}

// ignore_for_file: must_be_immutable
class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  // Map to store localized values
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enus, // Assuming `enUs` is defined in en_us_translations.dart
  };

  // Method to get the current AppLocalization instance
  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
      NavigatorService.navigatorKey.currentContext!,
      AppLocalization,
    )!;
  }

  // List of supported languages
  static List<String> languages() => _localizedValues.keys.toList();

  // Method to get localized string or fallback to the original
  String getString(String text) {
    return _localizedValues[locale.languageCode]?[text] ?? text;
  }
}

// Localization delegate class
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Check if the language is supported
    return AppLocalization.languages().contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) {
    // Return a synchronous future with the localization instance
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
