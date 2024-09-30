import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/core/utils/validation_funtion.dart';
import 'package:my_food_app/routes/app_routes.dart';
import 'package:my_food_app/screens/onboarding2_screen/onboarding2_screen.dart';
import 'package:my_food_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:my_food_app/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:my_food_app/screens/sign_in_screen/models/sign_in_model.dart';
import 'package:my_food_app/screens/sign_up_screeen/sign_up_screen.dart';
import 'package:my_food_app/widgets/utilfunction.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(
        SignInState(
          signInModelObj: const SignInModel(),
          // emailController: TextEditingController(), // Provide initial values
          // passwordController: TextEditingController(),
        ),
      )..add(SignInInitialEvent()),
      child: const SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme.whiteA70001,
      body: Stack(
        children: [
          // Background image with gradient
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          // Background image covering the top 30% of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: SizeUtils.height * 0.3, // 30% of the screen height
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.img110nboarding),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main content
          Positioned.fill(
            top: SizeUtils.height * 0.001, // Start content below the gradient
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 46.h, horizontal: 14.h),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage44,
                            height: 138.h,
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(horizontal: 74.h),
                          ),
                          Text(
                            "Food Ninja",
                            style: theme.textTheme.displayMedium,
                          ),
                          Text(
                            "Deliver Favorite Food",
                            style: theme.textTheme.labelLarge,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Login To Your Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          buildStackGoogle(context),
                          const SizedBox(height: 0),
                          buildForgotPassword(),
                          const SizedBox(height: 10),
                          buildLogin(context),
                          const SizedBox(height: 12),
                          buildSignupHere(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget for Google Button
  Widget buildGoogle(BuildContext context) {
    return CustomOutlinedButton(
      borderColor: Colors.transparent,
      width: 152.h,
      text: "Google",
      margin: EdgeInsets.only(bottom: 36.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogleIcon,
          height: 24.h,
          width: 24.h,
          fit: BoxFit.contain,
        ),
      ),
      onPressed: () async {
        showsimpleLoadingDialog(context);

        User? user = await signInWithGoogle();

        // Navigator.of(context).pop();

        if (user != null) {
          // Navigate to home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          ); // Save user data to Firestore
          await saveUserData1(user);
        } else {
          print('Google sign-in failed.');
        }
      },
      alignment: Alignment.bottomRight,
    );
  }

  /// Section Widget for Facebook Button
  Widget buildFacebook(BuildContext context) {
    return CustomOutlinedButton(
      borderColor: Colors.transparent,
      width: 152.h,
      text: "Facebook",
      margin: EdgeInsets.only(bottom: 36.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgFacebookIcon31,
          height: 24.h,
          width: 24.h,
          fit: BoxFit.contain,
        ),
      ),
      onPressed: () {
        // onTapFacebook(context);
      },
      alignment: Alignment.bottomLeft,
    );
  }

  /// Section Widget for Email Field
  Widget buildEmail(BuildContext context) {
    return BlocSelector<SignInBloc, SignInState, TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 28.h, vertical: 18.h),
          validator: (value) {
            if (value == null || !isValidEmail(value, isRequired: true)) {
              return "Please enter a valid email";
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget for Password Field
  Widget buildPassword(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return CustomTextFormField(
        controller: state.passwordController,
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 18.h),
        validator: (value) {
          if (value == null || !isValidPassword(value, isRequired: true)) {
            return "Please enter a valid password";
          }
          return null;
        },
      );
    });
  }

  /// Section Widget for stacking Google and Facebook buttons
  Widget buildStackGoogle(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildGoogle(context),
          buildFacebook(context),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildEmail(context),
                  const SizedBox(height: 12),
                  buildPassword(context),
                  const SizedBox(height: 12),
                  const Text(
                    "Or continue with",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget for Login Button
  Widget buildLogin(BuildContext context) {
    return CustomElevatedButton(
      width: 140.h,
      text: "Login",
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
      onPressed: () async {
        // Show loading dialog
        showLoadingDialog(context);

        // Get email and password from your TextEditingControllers
        final signInBloc = BlocProvider.of<SignInBloc>(context);
        final email = signInBloc.state.emailController?.text.trim();
        final password = signInBloc.state.passwordController?.text.trim();

//
        // Check if email and password are provided
        // if (email!.isEmpty || password!.isEmpty) {
        //   Navigator.pop(context); // Dismiss loading dialog
        //   showSnackbar(context, 'Email and password cannot be empty.');
        //   return;
        // }
        // Perform sign-in logic here (e.g., using Firebase Auth)
        if (email == null ||
            email.isEmpty ||
            password == null ||
            password.isEmpty) {
          // Show an error dialog if email or password is empty
          showDialog(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
              title: Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Text('Email and password cannot be empty.'),
              backgroundColor: Colors.blue,
            ),
          );
          return; // Early return if fields are empty
        }

        try {
          showLoadingDialog(context); // Show loading dialog
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
              email: email, password: password);
          String uid = userCredential.user!.uid;

          // Update Firestore user data upon login
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            // 'name': username ?? '',
            'uid': uid,
            'lastLogin': DateTime.now().toString(),
          }).then((_) {
            print("User details updated successfully in Firestore upon login.");
          }).catchError((error) {
            print("Failed to update user details in Firestore: $error");
          });
          // if (_rememberMe) {
          //   await _saveUserPreferences();
          // }
          Navigator.pop(context); // Dismiss loading dialog
          Navigator.pushReplacement(
            // Use pushReplacement to prevent going back to login
            context,
            MaterialPageRoute(
              builder: (context) => const Onboarding2Screen(),
            ),
          );
        } catch (e) {
          Navigator.pop(context); // Dismiss loading dialog
          print(e);
          String errorMessage = 'An error occurred';

          if (e is FirebaseAuthException) {
            if (e.code == 'user-not-found') {
              errorMessage = 'User not found. Please check your email.';
            } else if (e.code == 'wrong-password') {
              errorMessage = 'Incorrect password. Please try again.';
            } else {
              errorMessage = 'Authentication failed: ${e.message}';
            }
          }
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Text(errorMessage),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
    );
  }

  /// Section Widget for Forgot Password
  Widget buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        // Handle forgot password logic
      },
      child: RichText(
        text: TextSpan(
          text: "Forgot Password?",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: appTheme.greenA700,
            decoration: TextDecoration.underline,
            decorationColor: appTheme.greenA700,
            decorationThickness: 2.0, // Adjust thickness as needed
          ),
        ),
      ),
    );
  }

  /// Signup Here Text with Navigation to Signup Screen
  Widget buildSignupHere(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Signup Screen
        Navigator.pushNamed(context, AppRoutes.signUpScreen);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: theme.textTheme.bodyMedium?.copyWith(
                color:
                    appTheme.black900, // Set color for the non-clickable part
              ),
            ),
            TextSpan(
              text: "Signup here",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: appTheme.greenA700, // Set color for the clickable part
                decoration: TextDecoration.underline,
                decorationColor: appTheme.greenA700,
                decorationThickness: 2.0, // Adjust thickness as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//       try {
//         // Firebase login logic
//         UserCredential userCredential = await auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         String uid = userCredential.user!.uid;
//         await FirebaseFirestore.instance.collection('users').doc(uid).set({
//           'name': username ?? '',
//           'uid': uid,
//           'lastLogin': DateTime.now().toString(),
//         }).then((_) {
//           print("User details updated successfully in Firestore upon login.");
//         }).catchError((error) {
//           print("Failed to update user details in Firestore: $error");
//         });
//         Navigator.pop(context); // Dismiss loading dialog

//         // Navigate to Home Screen after successful login
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const SignUpScreen()),
//         );
//       } catch (e) {
//         Navigator.pop(context); // Dismiss loading dialog

//         // Handle FirebaseAuth exceptions
//         handleError(context, e);
//       }
//     },
//   );

// import 'package:flutter/material.dart';
// import 'package:my_food_app/core/utils/validation_funtion.dart';

// import '../../core/app_export.dart';
// // import '../../domain/facebookauth/facebook_auth_helper.dart';
// // import '../../domain/googleauth/google_auth_helper.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_outlined_button.dart';
// import '../../widgets/custom_text_form_field.dart';

// // static Widget builder(BuildContext context) {
// //   return BlocProvider<SignUpBloc>(
// //     create: (context) => SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
// //       ..add(SignUpInitialEvent()),
// //     child: const SignUpScreen(),
// //   );
// // }

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         extendBodyBehindAppBar: true,
//         backgroundColor: appTheme.whiteA70001,
//         body: Container(
//           width: double.maxFinite,
//           height: SizeUtils.height,
//           decoration: BoxDecoration(
//             color: appTheme.whiteA70001,
//             image: const DecorationImage(
//               image: AssetImage(ImageConstant.img110nboarding),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: SizedBox(
//             width: double.maxFinite,
//             child: SingleChildScrollView(
//               child: Container(
//                 width: double.maxFinite,
//                 padding: EdgeInsets.symmetric(vertical: 46.h, horizontal: 14.h),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.maxFinite,
//                       padding: EdgeInsets.symmetric(horizontal: 10.h),
//                       child: Column(
//                         children: [
//                           CustomImageView(
//                             imagePath: ImageConstant.imgImage44,
//                             height: 138.h,
//                             width: double.maxFinite,
//                             margin: EdgeInsets.symmetric(horizontal: 74.h),
//                           ),
//                           Text(
//                             "Food Ninja",
//                             style: theme.textTheme.displayMedium,
//                           ),
//                           Text(
//                             "Deliver Favorite Food",
//                             style: theme.textTheme.labelLarge,
//                           ),
//                           Text(
//                             "Login To Your Account",
//                             style: theme.textTheme.labelLarge,
//                           ),
//                           SizedBox(height: 60.h),
//                           buildStackGoogle(context),
//                           SizedBox(height: 38.h),
//                           buildLogin(context),
//                           SizedBox(height: 4.h),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget buildGoogle(BuildContext context) {
//     return CustomOutlinedButton(
//       width: 152.h,
//       text: "Google",
//       margin: EdgeInsets.only(bottom: 36.h),
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 12.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgGoogleIcon,
//           height: 24.h,
//           width: 24.h,
//           fit: BoxFit.contain,
//         ),
//       ),
//       onPressed: () {
//         // onTapGoogle(context);
//       },
//       alignment: Alignment.bottomRight,
//     );
//   }

//   /// Section Widget
//   Widget buildFacebook(BuildContext context) {
//     return CustomOutlinedButton(
//       width: 152.h,
//       text: "Facebook",
//       margin: EdgeInsets.only(bottom: 36.h),
//       leftIcon: Container(
//         margin: EdgeInsets.only(right: 12.h),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgFacebook31,
//           height: 24.h,
//           width: 24.h,
//           fit: BoxFit.contain,
//         ),
//       ),
//       onPressed: () {
//         // onTapFacebook(context);
//       },
//       alignment: Alignment.bottomLeft,
//     );
//   }

//   /// Section Widget
//   Widget buildEmail(BuildContext context) {
//     // return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
//     //   selector: (state) => state.emailController,
//     //   builder: (context, emailController) {
//     return CustomTextFormField(
//       // controller: emailController,
//       hintText: "Email",
//       textInputType: TextInputType.emailAddress,
//       contentPadding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 18.h),
//       validator: (value) {
//         if (value == null || !isValidEmail(value, isRequired: true)) {
//           return "Please enter a valid email";
//         }
//         return null;
//       },
//     );
//     // },
//     // );
//   }

//   /// Section Widget
//   Widget buildPassword(BuildContext context) {
//     // return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
//     //   selector: (state) => state.passwordController,
//     //   builder: (context, passwordController) {
//     return CustomTextFormField(
//       // controller: passwordController,
//       hintText: "Password",
//       textInputAction: TextInputAction.done,
//       textInputType: TextInputType.visiblePassword,
//       obscureText: true,
//       contentPadding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 18.h),
//       validator: (value) {
//         if (value == null || !isValidPassword(value, isRequired: true)) {
//           return "Please enter a valid password";
//         }
//         return null;
//       },
//     );
//     // },
//     // );
//   }

//   /// Section Widget
//   Widget buildStackGoogle(BuildContext context) {
//     return SizedBox(
//       height: 344.h,
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           buildGoogle(context),
//           buildFacebook(context),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding: EdgeInsets.only(top: 64.h),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   buildEmail(context),
//                   SizedBox(height: 12.h),
//                   buildPassword(context),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget buildLogin(BuildContext context) {
//     return CustomElevatedButton(
//       width: 140.h,
//       text: "Login",
//       buttonStyle: CustomButtonStyles.none,
//       decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
//       onPressed: () {
//         // Handle login action
//       },
//     );
//   }

// //   /// Google Authentication
// //   onTapGoogle(BuildContext context) async {
// //     await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
// //       if (googleUser != null) {
// //         // Handle success
// //       } else {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text('User data is empty')));
// //       }
// //     }).catchError((onError) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text(onError.toString())));
// //     });
// //   }

// //   /// Facebook Authentication
// //   onTapFacebook(BuildContext context) async {
// //     await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
// //       if (facebookUser != null) {
// //         // Handle success
// //       }
// //     }).catchError((onError) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text(onError.toString())));
// //     });
// //   }
// }
