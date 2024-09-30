import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showsimpleLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(text)),
  ));
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Loading, Please wait'),
        content: LinearProgressIndicator(),
        backgroundColor: Colors.deepOrange,
      );
    },
  );
}

void handleError(BuildContext context, dynamic e) {
  String errorMessage = 'An unknown error occurred.';
  if (e is FirebaseAuthException) {
    if (e.code == 'email-already-in-use') {
      errorMessage = 'Email is already in use';
    } else if (e.code == 'weak-password') {
      errorMessage = 'The password provided is too weak.';
    } else {
      errorMessage = 'An error occurred: ${e.message}';
    }
  }

  showErrorDialog(context, errorMessage);
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Center(
        child: Text(
          'Error',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      content: Text(message),
      backgroundColor: Colors.blue,
    ),
  );
}

// void showLogoutDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Confirm Logout'),
//         content: const Text('Are you sure you want to logout?'),
//         actions: [
//           TextButton(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//           ),
//           TextButton(
//             child: const Text('Logout'),
//             onPressed: () {
//               // Navigator.of(context).pop(); // Close the dialog
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Login_Screen3(),
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

Future<void> saveUserData(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();

  // Save email and password in shared preferences

  await prefs.setString('userEmail', email);
  await prefs.setString('userPassword', password);

  // Save a boolean flag (e.g., remember me) in shared preferences
  await prefs.setBool('rememberMe', true);
}

Future<void> loadUserData() async {
  final prefs = await SharedPreferences.getInstance();

  // Retrieve stored email and password
  String? email = prefs.getString('userEmail');
  String? password = prefs.getString('userPassword');

  // Retrieve a boolean flag (e.g., remember me)
  bool rememberMe = prefs.getBool('rememberMe') ?? false;

  // Do something with the retrieved values
  print('Email: $email');
  print('Password: $password');
  print('Remember Me: $rememberMe');
}

Future<void> removeUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userEmail'); // Remove email
  await prefs.remove('userPassword'); // Remove password
  await prefs.remove('rememberMe'); // Remove remember me flag
}

Future<void> sendEmailVerification(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null && !user.emailVerified) {
    try {
      await user.sendEmailVerification();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Verification Email Sent'),
            content: const Text(
                'A verification email has been sent to your email address. Please check your inbox and follow the instructions to verify your account.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to send verification email. ${e.toString()}'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

Future<User?> signInWithGoogle() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      print('Google sign-in aborted by user.');
      return null;
    }

    // Obtain the authentication details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google user credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // Return the signed-in user
    return userCredential.user;
  } catch (e) {
    print('Error during Google sign-in: $e');
    return null;
  }
}

Future<void> saveUserData1(User user) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('users').doc(user.uid).set({
      'name': user.displayName,
      'id': user.uid,
      'last_login': Timestamp.now(),
    });
    print('User data saved to Firestore.');
  } catch (e) {
    print('Error saving user data: $e');
  }
}

// Future<User?> signInWithFacebook() async {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   try {
//     // Trigger the authentication flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();

//     if (loginResult.status != LoginStatus.success) {
//       print('Facebook sign-in failed: ${loginResult.message}');
//       return null;
//     }

//     // Create a new credential
//     final AuthCredential credential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

//     // Sign in to Firebase with the Facebook user credentials
//     final UserCredential userCredential =
//         await auth.signInWithCredential(credential);

//     // Return the signed-in user
//     return userCredential.user;
//   } catch (e) {
//     print('Error during Facebook sign-in: $e');
//     return null;
//   }
// }

Future<void> saveUserData2(User user) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('users').doc(user.uid).set({
      'name': user.displayName,
      'id': user.uid,
      'last_login': Timestamp.now(),
    });
    print('User data saved to Firestore.');
  } catch (e) {
    print('Error saving user data: $e');
  }
}
