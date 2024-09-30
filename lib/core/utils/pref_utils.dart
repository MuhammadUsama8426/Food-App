// PrefUtils Class
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  // Constructor to initialize SharedPreferences instance
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  // Initialize SharedPreferences if not already initialized
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreferences Initialized');
  }

  /// Clears all the data stored in preferences
  void clearPreferencesData() async {
    await _sharedPreferences?.clear();
  }

  /// Set theme data in SharedPreferences
  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString("themeData", value);
  }

  /// Get theme data from SharedPreferences
  /// If no theme data is found, returns 'primary' as default
  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData') ?? 'primary';
    } catch (e) {
      return 'primary';
    }
  }
}
