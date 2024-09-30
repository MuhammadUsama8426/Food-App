// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:my_food_app/main.dart'; // Assuming this contains your app logic

// /// Abstract class for checking internet connectivity
// abstract class NetworkInfoI {
//   Future<bool> isConnected();
//   Future<ConnectivityResult> get connectivityResult;
//   Stream<ConnectivityResult> get onConnectivityChanged;
// }

// /// NetworkInfo class implementing NetworkInfoI to manage network checks
// class NetworkInfo implements NetworkInfoI {
//   Connectivity connectivity;

//   static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

//   factory NetworkInfo() {
//     return _networkInfo;
//   }

//   NetworkInfo._internal(this.connectivity) {
//     connectivity = connectivity;
//   }

//   /// Checks if the internet is connected or not
//   /// Returns [true] if connected, else returns [false]
//   @override
//   Future<bool> isConnected() async {
//     final result = await connectivityResult;
//     return result != ConnectivityResult.none;
//   }

//   /// Gets the type of internet connection
//   @override
//   Future<ConnectivityResult> get connectivityResult async {
//     return connectivity.checkConnectivity();
//   }

//   /// Stream for checking internet connection changes
//   @override
//   Stream<List<ConnectivityResult>> get onConnectivityChanged =>
//       connectivity.onConnectivityChanged;
// }

// /// Failure abstract class for error handling
// abstract class Failure {}

// /// General failures for various issues
// class ServerFailure extends Failure {}

// class CacheFailure extends Failure {}

// class NetworkFailure extends Failure {}

// /// Exception classes for error handling
// class ServerException implements Exception {}

// class CacheException implements Exception {}

// class NetworkException implements Exception {}

// /// Custom exception to throw when there's no internet
// class NoInternetException implements Exception {
//   late String _message;

//   NoInternetException([String message = 'No internet connection']) {
//     if (globalMessengerKey.currentState != null) {
//       globalMessengerKey.currentState!
//           .showSnackBar(SnackBar(content: Text(message)));
//     }
//     _message = message;
//   }

//   @override
//   String toString() => _message;
// }
