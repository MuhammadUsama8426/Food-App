import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/screens/onboarding1_screen/onboarding1_screen.dart';
import 'package:my_food_app/screens/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:my_food_app/screens/onboarding_screen/models/onboarding_model.dart';
import 'package:my_food_app/screens/sign_in_screen/sign_in_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (context) => OnboardingBloc(
        OnboardingState(onboardingModelObj: const OnboardingModel()),
      )..add(OnboardingInitialEvent()),
      child: const OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.whiteA70001,
            body: Stack(
              children: [
                // Background Image with Gradient Overlay
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height:
                        SizeUtils.height * 0.5, // Top 50% of the screen height
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(ImageConstant.img110nboarding),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3), // Start with black
                          Colors.transparent, // Transition to transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Bottom White Area
                Positioned(
                  top: SizeUtils.height * 0.5, // Start from the middle
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                // White Mask over the entire screen
                Positioned.fill(
                  child: Container(
                    color: Colors.white
                        .withOpacity(0.3), // Semi-transparent white mask
                  ),
                ),
                // Centered Content
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage44,
                          height: 138.0,
                          width: 174.0,
                          margin: const EdgeInsets.only(left: 6.0, right: 8.0),
                        ),
                        // Add space between image and text
                        Text(
                          "Food Ninja",
                          style: theme.textTheme.displayMedium?.copyWith(
                            color: Colors.green,
                            letterSpacing: 0, // Set letter spacing
                            fontFamily: 'Viga',
                            fontWeight: FontWeight.bold, // Make text bold
                            // Set font to Viga
                          ),
                        ),

                        Text(
                          "Deliver Favorite Food",
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Make text bold
                            fontSize: 18, // Set font size
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Space between text and buttons
                        // Row for Next and Get Started buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Next button
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to the first onboarding screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Onboarding1Screen(),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
