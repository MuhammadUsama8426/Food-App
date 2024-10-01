import 'package:flutter/material.dart';
import 'package:my_food_app/screens/explore_restaurant_screen/explore_restaurant_screen.dart';
import 'package:my_food_app/screens/onboarding1_screen/onboarding1_screen.dart';
import 'package:my_food_app/screens/onboarding2_screen/onboarding2_screen.dart';
import 'package:my_food_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:my_food_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:my_food_app/screens/sign_up_screeen/sign_up_screen.dart';
import 'package:my_food_app/screens/upload_photo_screen/upload_photo_screen.dart';
import 'package:my_food_app/screens/welcom_screen/welcome_screen.dart';

class AppRoutes {
  static const String signUpScreen = '/sign_up_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String onboarding1Screen = '/onboarding1_screen';
  static const String onboarding2Screen = '/onboarding2_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String signupProcessScreen = '/signup_process_screen';
  static const String paymentMethodScreen = '/payment_method_screen';
  static const String uploadPhotoScreen = '/upload_photo_screen';
  static const String uploadPreviewScreen = '/upload_preview_screen';
  static const String setLocationScreen = '/set_location_screen';
  static const String signupSuccessNotificationScreen =
      '/signup_success_notification_screen';
  static const String verificationCodeScreen = '/verification_code_screen';
  static const String viaMethodScreen = '/via_method_screen';
  static const String passwordScreen = '/password_screen';
  static const String successNotificationScreen =
      '/success_notification_screen';
  static const String homeScreen = '/home_screen';
  static const String welcomeScreen = '/welcome_screen';

  static const String homeInitialPage = '/home_initial_page';
  static const String exploreRestaurantScreen = '/explore_restaurant_screen';
  static const String filterScreen = '/filter_screen';
  static const String exploreMenuScreen = '/explore_menu_screen';
  static const String exploreMenuWithFilterScreen =
      '/explore_menu_with_filter_screen';
  static const String exploreRestaurantWithFilterScreen =
      '/explore_restaurant_with_filter_screen';
  static const String chatDetailsScreen = '/chat_details_screen';
  static const String callRingingScreen = '/call_ringing_screen';
  static const String callScreen = '/call_screen';
  static const String finishOrderScreen = '/finish_order_screen';
  static const String rateFoodScreen = '/rate_food_screen';
  static const String rateRestaurantScreen = '/rate_restaurant_screen';
  static const String voucherPromoScreen = '/voucher_promo_screen';
  static const String notificationScreen = '/notification_screen';
  static const String orderDetailsScreen = '/order_details_screen';
  static const String orderDetailsWithTrashScreen =
      '/order_details_with_trash_screen';
  static const String paymentsScreen = '/payments_screen';
  static const String editPaymentsScreen = '/edit_payments_screen';
  static const String editLocationScreen = '/edit_location_screen';
  static const String yourOrdersScreen = '/your_orders_screen';
  static const String setLocation1Screen = '/set_location1_screen';

  static const String appNavigationScreen = "app_navigation_screen";
  static const String initialRoute = "initialRoute";

  static Map<String, WidgetBuilder> get routes => {
        signUpScreen: (context) => SignUpScreen.builder(context),
        onboardingScreen: (context) => OnboardingScreen.builder(context),
        onboarding1Screen: (context) => Onboarding1Screen.builder(context),
        onboarding2Screen: (context) => Onboarding2Screen.builder(context),
        signInScreen: SignInScreen.builder,
        welcomeScreen: (context) => WelcomeScreen(),

        // SignupProcessScreen.routeName: (context) =>
        // SignupProcessScreen.builder(),
        // PaymentMethodScreen.routeName: (context) =>
        //     PaymentMethodScreen.builder(),
        uploadPhotoScreen: UploadPhotoScreen.builder,
        // uploadPreviewScreen: UploadPreviewScreen.builder, ye bad m thk karonga
        // SetLocationScreen.routeName: (context) =>
        // setLocationScreen: SetLocationScreen.builder,
        // SignupSuccessNotificationScreen.routeName: (context) =>
        //     SignupSuccessNotificationScreen.builder(),
        // VerificationCodeScreen.routeName: (context) =>
        //     VerificationCodeScreen.builder(),
        // ViaMethodScreen.routeName: (context) => ViaMethodScreen.builder(),
        // PasswordScreen.routeName: (context) => PasswordScreen.builder(),
        // SuccessNotificationScreen.routeName: (context) =>
        //     SuccessNotificationScreen.builder(),
        // HomeScreen.routeName: (context) => HomeScreen.builder(),

        exploreRestaurantScreen: ExploreRestaurantScreen.builder,
        // FilterScreen.routeName: (context) => FilterScreen.builder(),
        // ExploreMenuScreen.routeName: (context) => ExploreMenuScreen.builder(),
        // ExploreRestaurantWithFilterScreen.routeName: (context) =>
        //     ExploreRestaurantWithFilterScreen.builder(),
        // ExploreMenuWithFilterScreen.routeName: (context) =>
        //     ExploreMenuWithFilterScreen.builder(),
        // ChatDetailsScreen.routeName: (context) => ChatDetailsScreen.builder(),
        // CallRingingScreen.routeName: (context) => CallRingingScreen.builder(),
        // CallScreen.routeName: (context) => CallScreen.builder(),
        // FinishOrderScreen.routeName: (context) => FinishOrderScreen.builder(),
        // RateFoodScreen.routeName: (context) => RateFoodScreen.builder(),
        // RateRestaurantScreen.routeName: (context) =>
        //     RateRestaurantScreen.builder(),
        // VoucherPromoScreen.routeName: (context) => VoucherPromoScreen.builder(),
        // NotificationScreen.routeName: (context) => NotificationScreen.builder(),
        // OrderDetailsScreen.routeName: (context) => OrderDetailsScreen.builder(),
        // OrderDetailsWithTrashScreen.routeName: (context) =>
        //     OrderDetailsWithTrashScreen.builder(),
        // PaymentsScreen.routeName: (context) => PaymentsScreen.builder(),
        // EditPaymentsScreen.routeName: (context) => EditPaymentsScreen.builder(),
        // EditLocationScreen.routeName: (context) => EditLocationScreen.builder(),
        // YourOrdersScreen.routeName: (context) => YourOrdersScreen.builder(),
        // SetLocation1Screen.routeName: (context) => SetLocation1Screen.builder(),
        // AppNavigationScreen.routeName: (context) =>
        //     AppNavigationScreen.builder(),
        initialRoute: ExploreRestaurantScreen.builder,
      };
}
