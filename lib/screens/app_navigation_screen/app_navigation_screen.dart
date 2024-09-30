import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/screens/app_navigation_screen/bloc/app_navigation_bloc.dart';
import 'package:my_food_app/screens/app_navigation_screen/models/app_navigation_model.dart';
// import 'package:your_package_name/core/app_export.dart';
// import 'package:your_package_name/detail_menu_bottomsheet/detail_menu_bottomsheet.dart';
// import 'package:your_package_name/detail_menu_scroll_mode_bottomsheet/detail_menu_scroll_mode_bottomsheet.dart';
// import 'package:your_package_name/detail_product_bottomsheet/detail_product_bottomsheet.dart';
// import 'package:your_package_name/detail_product_scroll_mode_bottomsheet/detail_product_scroll_mode_bottomsheet.dart';
// import 'package:your_package_name/profile_bottomsheet/profile_bottomsheet.dart';
// import 'package:your_package_name/profile_scroll_mode_bottomsheet/profile_scroll_mode_bottomsheet.dart';
// import 'package:your_package_name/bloc/app_navigation_bloc.dart';
// import 'package:your_package_name/models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(
        AppNavigationState(appNavigationModelObj: const AppNavigationModel()),
      )..add(AppNavigationInitialEvent()),
      child: const AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: const Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: const Text(
                            "Check your app's UI from the below demo screens of your app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFF000000),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Column(
                                children: [
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.4 Sign Up",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.signUpScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.1 Onboarding",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.onboardingScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.2 Onboarding",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.onboarding1Screen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.3 Onboarding",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.onboarding2Screen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.5 Sign In",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.signInScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.6 Signup Process",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.signupProcessScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.7 Payment Method",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.paymentMethodScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.8 Upload Photo",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.uploadPhotoScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.9 Upload Preview",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.uploadPreviewScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.10 Set Location",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.setLocationScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle:
                                        "1.11 Signup Success Notification",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes
                                            .signupSuccessNotificationScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.12 Verification Code",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.verificationCodeScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.13 Via Method",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.viaMethodScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.14 Password",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.passwordScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.15 Success Notification",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.successNotificationScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.16 Home",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.welcomeScreen),
                                  ),

                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.17 Explore Restaurant",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.exploreRestaurantScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.18 Filter",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.filterScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.19 Explore Menu",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.exploreMenuScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle:
                                        "1.20 Explore Restaurant With Filter",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes
                                            .exploreRestaurantWithFilterScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle:
                                        "1.21 Explore Menu With Filter",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.exploreMenuWithFilterScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.23 Chat Details",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.chatDetailsScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.24 Call Ringing",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.callRingingScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.25 Call",
                                    onTapScreenTitle: () =>
                                        onTapScreenTitle(AppRoutes.callScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.26 Finish Order",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.finishOrderScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.27 Rate Food",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.rateFoodScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.28 Rate Restaurant",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.rateRestaurantScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.29 Voucher Promo",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.voucherPromoScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.30 Notification",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.notificationScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.31 Order Details",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.orderDetailsScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle:
                                        "1.32 Order Details With Trash",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.orderDetailsWithTrashScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.33 Payments",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.paymentsScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.34 Edit Payments",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.editPaymentsScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.35 Edit Location",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.editLocationScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.36 Your Orders",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.yourOrdersScreen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.37 Set Location",
                                    onTapScreenTitle: () => onTapScreenTitle(
                                        AppRoutes.setLocation1Screen),
                                  ),
                                  buildScreenTitle(
                                    context,
                                    screenTitle: "1.38 Welcome",
                                    onTapScreenTitle: () =>
                                        onTapScreenTitle(AppRoutes.homeScreen),
                                  ),
                                  // buildScreenTitle(
                                  //   context,
                                  //   screenTitle: "1.38 Detail Product BottomSheet",
                                  //   onTapScreenTitle: () => onTapScreenTitle(
                                  //       AppRoutes.DetailProduct),
                                  // ),
                                  // buildScreenTitle(
                                  //   context,
                                  //   screenTitle: "1.39 Add Payment Method",
                                  //   onTapScreenTitle: () => onTapScreenTitle(
                                  //       AppRoutes.addPaymentMethodScreen),
                                  // ),
                                  // buildScreenTitle(
                                  //   context,
                                  //   screenTitle: "1.40 Add New Card",
                                  //   onTapScreenTitle: () => onTapScreenTitle(
                                  //       AppRoutes.addNewCardScreen),
                                  // ),
                                  // buildScreenTitle(
                                  //   context,
                                  //   screenTitle: "1.41 User Profile",
                                  //   onTapScreenTitle: () => onTapScreenTitle(
                                  //       AppRoutes.userProfileScreen),
                                  // ),
                                  // buildScreenTitle(
                                  //   context,
                                  //   screenTitle: "1.42 Order Summary",
                                  //   onTapScreenTitle: () => onTapScreenTitle(
                                  //       AppRoutes.orderSummaryScreen),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Common click event for bottom sheet
void onTapBottomSheetTitle(BuildContext context, Widget className) {
  showModalBottomSheet(
    context: context,
    builder: (context) => className,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

/// Common widget for screen titles
Widget buildScreenTitle(
  BuildContext context, {
  required String screenTitle,
  Function? onTapScreenTitle,
}) {
  return GestureDetector(
    onTap: () {
      onTapScreenTitle?.call();
    },
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              screenTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF888888),
          ),
        ],
      ),
    ),
  );
}

/// Common click event
void onTapScreenTitle(String routeName) {
  NavigatorService.pushNamed(routeName);
}
