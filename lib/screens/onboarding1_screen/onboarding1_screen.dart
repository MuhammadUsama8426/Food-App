import 'package:flutter/material.dart';
import 'package:my_food_app/screens/onboarding1_screen/bloc/onboarding1_bloc.dart';
import 'package:my_food_app/screens/onboarding1_screen/models/onboarding1_model.dart';
import 'package:my_food_app/screens/onboarding2_screen/onboarding2_screen.dart';
import 'package:my_food_app/screens/sign_in_screen/sign_in_screen.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider<Onboarding1Bloc>(
      create: (context) => Onboarding1Bloc(
        Onboarding1State(onboarding1ModelObj: const Onboarding1Model()),
      )..add(Onboarding1InitialEvent()),
      child: const Onboarding1Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          // Full screen gradient background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white60],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 56.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Stack to overlay gradient on top of the image
                  Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgIllustration,
                        height: 434.h,
                        width: double.maxFinite,
                        fit: BoxFit
                            .cover, // Ensures the image covers the container
                      ),
                      // Gradient over the image
                      Container(
                        height: 434.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(
                                  0.8), // White gradient with opacity
                              Colors.white.withOpacity(0.5),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  buildColumnSubtitle(context),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Next button
                      CustomElevatedButton(
                        width: 156.h,
                        text: "Next",
                        onPressed: () {
                          // Navigate to the next onboarding screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Onboarding2Screen(),
                            ),
                          );
                        },
                        buttonStyle: CustomButtonStyles.none,
                        decoration: CustomButtonStyles
                            .gradientGreenAToPrimaryDecoration,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Navigate to the second onboarding screen
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const Onboarding2Screen(),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text("Next"),
                      // ),
                      const SizedBox(width: 20), // Space between buttons
                      // Get Started button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the sign-in screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: const Text("Get Started"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumnSubtitle(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [
          SizedBox(
            width: 202.h,
            child: Text(
              "Find your Comfort Food Here",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              // Making text bold
              style: CustomTextStyles.titleLargeBlack900_1.copyWith(
                height: 1.31,
                fontWeight: FontWeight.bold, // Set text to bold
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 222.h,
            child: Text(
              "Here You Can find a chef or dish for every taste and color you Enjoy!",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  CustomTextStyles.bodySmallBentonSansBookBlack9000112.copyWith(
                height: 1.81,
              ),
            ),
          ),
          SizedBox(height: 44.h),
          // Rendering the "Next" button only once
          // CustomElevatedButton(
          //   width: 156.h,
          //   text: "Next",
          //   onPressed: () {
          //     // Navigate to the next onboarding screen
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const Onboarding1Screen(),
          //       ),
          //     );
          //   },
          //   buttonStyle: CustomButtonStyles.none,
          //   decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
          // ),
        ],
      ),
    );
  }
}
