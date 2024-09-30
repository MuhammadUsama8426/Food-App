import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_food_app/screens/set_location_screen/map_screen/map_screen.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore_for_file: must_be_immutable
class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    bool routePredicate = false,
    dynamic arguments,
  }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => routePredicate,
      arguments: arguments,
    );
  }

  static Future<dynamic> popAndPushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  //
  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      var result = await Permission.location.request();
      if (result.isDenied) {
        // // Handle permission denied, possibly show a message
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Location permission is required.')),
        // );
      } else if (result.isPermanentlyDenied) {
        // Open app settings to allow the user to grant permission
        openAppSettings();
      }
    }
  }

  static Future<LatLng?> openGoogleMaps(BuildContext context) async {
    LatLng? selectedLocation;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapScreen(
          onLocationSelected: (LatLng location) {
            selectedLocation = location; // Capture the selected location
          },
        ),
      ),
    );

    return selectedLocation; // Return the selected location
  }
}
