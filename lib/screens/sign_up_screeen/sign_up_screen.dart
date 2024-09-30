import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/core/utils/validation_funtion.dart';
import 'package:my_food_app/screens/onboarding1_screen/onboarding1_screen.dart';
import 'package:my_food_app/screens/sign_up_screeen/bloc/sign_up_bloc.dart';
import 'package:my_food_app/screens/sign_up_screeen/models/sign_up_model.dart';
import 'package:my_food_app/widgets/utilfunction.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
        SignUpState(signUpModelObj: const SignUpModel()),
      )..add(SignUpInitialEvent()),
      child: const SignUpScreen(),
    );
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

final auth = FirebaseAuth.instance;

class _SignUpScreenState extends State<SignUpScreen> {
  bool _keepMeSignedIn = false;
  final bool _emailMeAboutSpecialPricing = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: appTheme.whiteA70001,
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: SizeUtils.height * 0.3,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.img110nboarding),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: SizeUtils.height * 0.001,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.h, vertical: 22.h),
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgImage44,
                                height: 138.h,
                                width: double.infinity,
                                margin:
                                    EdgeInsets.only(left: 72.h, right: 78.h),
                              ),
                              Text(
                                "Food Ninja",
                                style: theme.textTheme.displayMedium,
                              ),
                              Text(
                                "Deliver Favorite Food",
                                style: theme.textTheme.labelLarge,
                              ),
                              SizedBox(height: 50.h),
                              Text(
                                "Sign Up For Free",
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 40.h),
                              buildNameFormOne(context),
                              SizedBox(height: 12.h),
                              buildEmail(context),
                              SizedBox(height: 12.h),
                              buildPassword(context),
                              SizedBox(height: 18.h),
                              SizedBox(height: 42.h),
                              buildCreateAccount(context),
                              SizedBox(height: 22.h),
                              Text(
                                "Already have an Account",
                                style: CustomTextStyles
                                    .bodySmallBentonSansMediumGreenA200
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        // Get the current state from the SignUpBloc
        final signUpBloc = BlocProvider.of<SignUpBloc>(context);
        final email = signUpBloc.state.emailController?.text;
        final password = signUpBloc.state.passwordController?.text;
        final username = signUpBloc.state.nameformoneController?.text;

        // Show loading dialog
        showLoadingDialog(context);

        // Check if email or password is empty
        if (email == null ||
            email.isEmpty ||
            password == null ||
            password.isEmpty) {
          Navigator.pop(context); // Dismiss loading dialog
          showErrorDialog(context, 'Email and password cannot be empty.');
          return;
        }

        try {
          // Firebase account creation logic
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: email, password: password);
          String uid = userCredential.user!.uid;

          // Sending email verification
          await sendEmailVerification(context);

          // Save additional user data to Firestore
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'name': username ?? '',
            'uid': uid,
            'lastLogin': DateTime.now().toString(),
          });

          Navigator.pop(context); // Dismiss loading dialog

          // Navigate to Login Screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Onboarding1Screen(),
            ),
          );

          // Show success message
          showSnackbar(context, 'You have successfully created your account');
        } catch (e) {
          Navigator.pop(context); // Dismiss loading dialog
          handleError(context, e);
        }
      },
      text: "Create Account",
      margin: EdgeInsets.symmetric(horizontal: 74.h),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
    );
  }

  Widget buildEmailMeAbout(
    BuildContext context, {
    required String byTappingOne,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        CustomCheckbox(
          value: value,
          onChanged: (value) {
            setState(() {
              _keepMeSignedIn = value ?? false; // Adjust this line as needed
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(
            byTappingOne,
            style: CustomTextStyles.bodySmallBentonSansBookBlack90001.copyWith(
              color: appTheme.black90001.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildNameFormOne(BuildContext context) {
  return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
    selector: (state) => state.nameformoneController,
    builder: (context, nameformoneController) {
      return CustomTextFormField(
        controller: nameformoneController,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Name cannot be empty';
          return null;
        },
        hintText: "Name",
        prefix: Container(
          margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconlyBulkProfile,
            height: 24.h,
            width: 24.h,
            fit: BoxFit.contain,
          ),
        ),
        prefixConstraints: BoxConstraints(maxHeight: 56.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
      );
    },
  );
}

Widget buildEmail(BuildContext context) {
  return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
    selector: (state) => state.emailController,
    builder: (context, emailController) {
      return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconlyBulkMessage,
            height: 24.h,
            width: 24.h,
            fit: BoxFit.contain,
          ),
        ),
        prefixConstraints: BoxConstraints(maxHeight: 56.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
        validator: (value) {
          if (value == null || !isValidEmail(value, isRequired: true)) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      );
    },
  );
}

Widget buildPassword(BuildContext context) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return CustomTextFormField(
        controller: state.passwordController,
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconlyBulkLock,
            height: 24.h,
            width: 24.h,
            fit: BoxFit.contain,
          ),
        ),
        prefixConstraints: BoxConstraints(maxHeight: 56.h),
        suffix: InkWell(
          onTap: () {
            context.read<SignUpBloc>().add(
                ChangePasswordVisibilityEvent(value: !state.isShowPassword));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16.h, 14.h, 18.h, 14.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgEye,
              height: 24.h,
              width: 24.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.h),
        obscureText: state.isShowPassword,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
        validator: (value) {
          if (value == null || !isValidPassword(value, isRequired: true)) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
      );
    },
  );
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24.h,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? appTheme.green100 : Colors.grey,
            width: 2.h,
          ),
          color: value ? appTheme.green100 : Colors.white,
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 16.h,
                color: appTheme.whiteA700,
              )
            : null,
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:my_food_app/core/utils/validation_funtion.dart';
// import 'package:my_food_app/screens/sign_up_screeen/bloc/sign_up_bloc.dart';
// import 'package:my_food_app/screens/sign_up_screeen/models/sign_up_model.dart';

// import '../../core/app_export.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_text_form_field.dart';

// class SignUpScreen extends StatelessWidget {
//   bool ischecked = false;
//   bool isObscured = true;
//   SignUpScreen({super.key});

//   static Widget builder(BuildContext context) {
//     return BlocProvider<SignUpBloc>(
//       create: (context) => SignUpBloc(
//         const SignUpState(signUpModelObj: SignUpModel()),
//       )..add(SignUpInitialEvent()),
//       child: SignUpScreen(),
//     );
//   }

//   bool _keepMeSignedIn = false;
//   bool _emailMeAboutSpecialPricing = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           extendBody: true,
//           extendBodyBehindAppBar: true,
//           backgroundColor: appTheme.whiteA70001,
//           body: Stack(
//             children: [
//               // Background image with gradient
//               Positioned.fill(
//                 child: Container(
//                   color: Colors.white,
//                 ),
//               ),
//               // Background image covering the top 30% of the screen
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 height: SizeUtils.height * 0.3, // 30% of the screen height
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(ImageConstant.img110nboarding),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               // Main content
//               Positioned.fill(
//                 top: SizeUtils.height *
//                     0.001, // Start content below the gradient
//                 child: SingleChildScrollView(
//                   child: Container(
//                     width: double.infinity,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 14.h, vertical: 22.h),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 24.h),
//                         Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(horizontal: 10.h),
//                           child: Column(
//                             children: [
//                               CustomImageView(
//                                 imagePath: ImageConstant.imgImage44,
//                                 height: 138.h,
//                                 width: double.infinity,
//                                 margin:
//                                     EdgeInsets.only(left: 72.h, right: 78.h),
//                               ),
//                               Text(
//                                 "Food Ninja",
//                                 style: theme.textTheme.displayMedium,
//                               ),
//                               Text(
//                                 "Deliver Favorite Food",
//                                 style: theme.textTheme.labelLarge,
//                               ),
//                               SizedBox(height: 50.h),
//                               Text(
//                                 "Sign Up For Free",
//                                 style: theme.textTheme.labelLarge?.copyWith(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold, // Make text bold
//                                   fontSize: 20, // Set font size
//                                 ),
//                               ),
//                               SizedBox(height: 40.h),
//                               buildNameFormOne(context),
//                               SizedBox(height: 12.h),
//                               buildEmail(context),
//                               SizedBox(height: 12.h),
//                               buildPassword(context),
//                               SizedBox(height: 18.h),
//                               // _buildChecklist(context),
//                               SizedBox(height: 42.h),
//                               buildCreateAccount(context),
//                               SizedBox(height: 22.h),
//                               Text(
//                                 "Already have an Account",
//                                 style: CustomTextStyles
//                                     .bodySmallBentonSansMediumGreenA200
//                                     .copyWith(
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   /// Section Widget
//   Widget buildNameFormOne(BuildContext context) {
//     return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
//       selector: (state) =>
//           state.nameformoneController, // Selector for nameformoneController
//       builder: (context, nameformoneController) {
//         return CustomTextFormField(
//           controller: nameformoneController, // Attach the controller
//           hintText: "Name",
//           prefix: Container(
//             margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
//             child: CustomImageView(
//               imagePath: ImageConstant
//                   .imgIconlyBulkProfile, // Set image path for profile
//               height: 24.h,
//               width: 24.h,
//               fit: BoxFit.contain,
//             ),
//           ),
//           prefixConstraints: BoxConstraints(maxHeight: 56.h),
//           contentPadding:
//               EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
//         );
//       },
//     );
//   }

//   /// Section Widget
//   Widget buildEmail(BuildContext context) {
//     return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
//         selector: (state) =>
//             state.emailController, // Selector for nameformoneController
//         builder: (context, emailController) {
//           return CustomTextFormField(
//             controller: emailController, // Attach the controller

//             hintText: "Email",
//             textInputType: TextInputType.emailAddress,
//             prefix: Container(
//               margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgIconlyBulkMessage,
//                 height: 24.h,
//                 width: 24.h,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             prefixConstraints: BoxConstraints(maxHeight: 56.h),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
//             validator: (value) {
//               if (value == null || !isValidEmail(value, isRequired: true)) {
//                 return "err_msg_please_enter_valid_email".tr;
//               }
//               return null;
//             },
//           );
//         });
//   }

//   /// Section Widget
//   Widget buildPassword(BuildContext context) {
//     return BlocBuilder<SignUpBloc, SignUpState>(
//         // Selector for nameformoneController
//         builder: (context, state) {
//       return CustomTextFormField(
//         controller: state.passwordController,
//         hintText: "Password",
//         textInputAction: TextInputAction.done,
//         textInputType: TextInputType.visiblePassword,
//         prefix: Container(
//           margin: EdgeInsets.fromLTRB(18.h, 14.h, 12.h, 14.h),
//           child: CustomImageView(
//             imagePath: ImageConstant.imgIconlyBulkLock,
//             height: 24.h,
//             width: 24.h,
//             fit: BoxFit.contain,
//           ),
//         ),
//         prefixConstraints: BoxConstraints(maxHeight: 56.h),
//         suffix: InkWell(
//           onTap: () {
//             context.read<SignUpBloc>().add(
//                 ChangePasswordVisibilityEvent(value: !state.isShowPassword));
//           },
//           child: Container(
//             margin: EdgeInsets.fromLTRB(16.h, 14.h, 18.h, 14.h),
//             child: CustomImageView(
//               imagePath: ImageConstant.imgEye,
//               height: 24.h,
//               width: 24.h,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         suffixConstraints: BoxConstraints(maxHeight: 56.h),
//         obscureText: state.isShowPassword,
//         contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.h),
//         validator: (value) {
//           if (value == null || !isValidPassword(value, isRequired: true)) {
//             return "err_msg_please_enter_valid_password".tr;
//           }
//           return null;
//         },
//       );
//     });
//   }

//   // / Section Widget
//   Widget _buildChecklist(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: buildEmailMeAbout(
//               context,
//               byTappingOne: "Keep Me Signed In",
//               value: _keepMeSignedIn,
//               onChanged: (bool? newValue) {
//                 setState(() {
//                   _keepMeSignedIn = newValue ?? false;
//                 });
//               },
//             ),
//           ),
//           SizedBox(height: 12.h),
//           SizedBox(
//             width: double.infinity,
//             child: buildEmailMeAbout(
//               context,
//               byTappingOne: "Email Me About Special Pricing",
//               value: _emailMeAboutSpecialPricing,
//               onChanged: (bool? newValue) {
//                 setState(() {
//                   _emailMeAboutSpecialPricing = newValue ?? false;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget buildCreateAccount(BuildContext context) {
//     return CustomElevatedButton(
//       text: "Create Account",
//       margin: EdgeInsets.symmetric(horizontal: 74.h),
//       buttonStyle: CustomButtonStyles.none,
//       decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
//     );
//   }

//   /// Common Widget
//   Widget buildEmailMeAbout(
//     BuildContext context, {
//     required String byTappingOne,
//     required bool value,
//     required ValueChanged<bool?> onChanged,
//   }) {
//     return Row(
//       children: [
//         CustomCheckbox(
        
//           value: _keepMeSignedIn,
//           onChanged: (value) {
//             setState(() {
//               _keepMeSignedIn = value ?? false;
//             });
//           },
//           // activeColor: Colors.blue, // You can customize this color as needed

//         ),
        
//         Padding(
//           padding: EdgeInsets.only(left: 8.h),
//           child: Text(
//             byTappingOne,
//             style: CustomTextStyles.bodySmallBentonSansBookBlack90001.copyWith(
//               color: appTheme.black90001.withOpacity(0.5),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;

//   const CustomCheckbox(
//       {super.key, required this.value, required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onChanged(!value),
//       child: Container(
//         width: 24.h,
//         height: 24.h,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: value ? appTheme.green100 : Colors.grey,
//             width: 2.0,
//           ),
//           color: value ? appTheme.green100 : Colors.transparent,
//         ),
//         child: value
//             ? Center(
//                 child: Icon(
//                   Icons.check,
//                   size: 16.h,
//                   color: Colors.white,
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
