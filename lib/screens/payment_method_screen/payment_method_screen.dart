import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

// static Widget builder(BuildContext context) {
//   return BlocProvider<PaymentMethodBloc>(
//     create: (context) => PaymentMethodBloc(PaymentMethodState(
//       paymentMethodModelObj: PaymentMethodModel(),
//     ))..add(PaymentMethodInitialEvent()),
//     child: PaymentMethodScreen(),
//   );
// }
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen(BuildContext context, {super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Stack contains title, icon, and text
                buildStackTitleOne(context),

                // Now place the image below the Stack in a Column
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 17.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height:
                            153, // Total height to include both image and color bar
                        width: 93, // Width of the container
                        child: Stack(
                          clipBehavior: Clip
                              .none, // Allows the color to overflow if necessary
                          children: [
                            // Circular color bar at the bottom
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 150, // Height of the color bar
                                width:
                                    43, // Width should match the parent to be centered properly
                                decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9), // Desired color
                                  shape: BoxShape
                                      .circle, // Makes the container circular
                                ),
                              ),
                            ),
                            // Circular image centered above the color bar
                            Positioned(
                              top: 40,
                              child: ClipOval(
                                child: SizedBox(
                                  height: 73, // Size of the image
                                  width: 73,
                                  child: Image.asset(
                                    "assets/images/paypal_button.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 193,
                        child: Image.asset(
                          "assets/images/payoneer_button.png",
                          height:
                              103, // Sets the height of the image to match the container
                          fit: BoxFit
                              .contain, // Ensures the image fits well within the container
                        ),
                      ),

                      // Next button
                      CustomElevatedButton(
                        buttonStyle: CustomButtonStyles.none,
                        decoration: CustomButtonStyles
                            .gradientGreenAToPrimaryDecoration,
                        width: 156.h,
                        text: "Next",
                      ),

                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget: This contains the stack for the title, icon, and text.
  Widget buildStackTitleOne(BuildContext context) {
    return Container(
      height: 130.h, // Adjust the height since the image has been moved out
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 24.h),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          // Vector icon at the top
          Align(
            alignment: Alignment.topLeft,
            child: CustomAppBar(
              leadingWidth: 44.h,
              leading: AppbarLeadingIconButton(
                imagePath: ImageConstant.imgVector,
                onTap: () {
                  onTapVectorOne(context);
                },
              ),
            ),
          ),

          // Payment Method Text
          Positioned(
            top: 50.h,
            left: 0,
            child: Text(
              "Payment Method",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          // Data will be displayed text
          Positioned(
            top: 90.h,
            left: 0,
            child: SizedBox(
              width: 228.h,
              child: Text(
                "This data will be displayed in your account profile for Security",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallBentonSansBookBlack9000112
                    .copyWith(height: 1.81),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  void onTapVectorOne(BuildContext context) {
    NavigatorService.goBack();
  }
}
