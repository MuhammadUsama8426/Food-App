import 'package:flutter/material.dart';
import 'package:my_food_app/screens/onboarding2_screen/bloc/onboarding2_bloc.dart';
import 'package:my_food_app/screens/onboarding2_screen/models/onbaording2_model.dart';
import 'package:my_food_app/screens/sign_in_screen/sign_in_screen.dart';

import '../../core/app_export.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider<Onboarding2Bloc>(
      create: (context) => Onboarding2Bloc(
        Onboarding2State(onboarding2ModelObj: const Onboarding2Model()),
      )..add(Onboarding2InitialEvent()),
      child: const Onboarding2Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img2Illustration,
                    height: 382.h,
                    width: double.maxFinite,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 40.h),
                  _buildColumnTitle(context),
                  SizedBox(height: 50.h),
                  // CustomElevatedButton(
                  //   width: 156.h,
                  //   text: "Next",
                  //   buttonStyle: CustomButtonStyles.none,
                  //   decoration:
                  //       CustomButtonStyles.gradientGreenAToPrimaryDecoration,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Next button (can be used to go to the next onboarding step if needed)
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
                        child: const Text("Next"),
                      ),
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

  /// Widget for building the column title
  Widget _buildColumnTitle(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First Text Widget (Main Title)
                Text(
                  "Food Ninja is Where Your Comfort Food Lives",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleLargeBlack900_1.copyWith(
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // A SizedBox to add spacing between the texts
                SizedBox(height: 10.h),
                // Second Text Widget (Sub-Title)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45), // Adjust padding if needed
                  child: Text(
                    "Enjoy a fast and smooth food delivery at your doorstep",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmallBentonSansBookBlack9000112
                        .copyWith(
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
