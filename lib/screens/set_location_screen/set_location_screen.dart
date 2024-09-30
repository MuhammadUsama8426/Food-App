import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_food_app/screens/set_location_screen/bloc/set_location_bloc.dart';
import 'package:my_food_app/screens/set_location_screen/models/set_location_model.dart';
import 'package:my_food_app/theme/custom_button_style.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SetLocationBloc>(
      create: (context) => SetLocationBloc(const SetLocationState(
        setLocationModelObj: SetLocationModel(),
      ))
        ..add(SetLocationInitialEvent()),
      child: const SetLocationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetLocationBloc, SetLocationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white, // Set background color to white
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStackTitleOne(context),
                    const SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 22.h,
                      ),
                      child: Column(
                        children: [
                          _buildSetLocation(
                              context,
                              state.setLocationModelObj?.location,
                              state.setLocationModelObj
                                  ?.locationName // Pass the location name here
                              ),
                          SizedBox(height: 36.h),
                          CustomElevatedButton(
                            width: 156.h,
                            text: "Next",
                            buttonStyle: CustomButtonStyles.none,
                            decoration: CustomButtonStyles
                                .gradientGreenAToPrimaryDecoration,
                          ),
                          SizedBox(height: 36.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section: Widget for Stack Title
  Widget _buildStackTitleOne(BuildContext context) {
    return Container(
      height: 196.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 24.h),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup186x340,
            height: 186.h,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8.h),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "msg_set_your_location".tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 26.h),
              SizedBox(
                width: 228.h,
                child: Text(
                  "msg_this_data_will_be".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodySmallBentonSansBookBlack90001
                      .copyWith(height: 1.81),
                ),
              ),
            ],
          ),
          CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarLeadingIconButton(
              imagePath: ImageConstant.imgVector,
              onTap: () {
                onTapVectorOne(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section: Widget for Set Location
  Widget _buildSetLocation(
      BuildContext context, LatLng? location, String? locationName) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadiusStyle.roundedBorder22,
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA20011,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          SizedBox(
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgLinkedin,
                    height: 32.h,
                    width: 32.h,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 14.h), // Space between the image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Aligns text to the start
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            locationName != null
                                ? 'Selected Location:' // Displaying static text for the label
                                : 'Loading location name...', // Placeholder while loading
                            style: CustomTextStyles
                                .bodyMediumBentonSansMediumBlack900,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top:
                                  4.h), // Space between label and location name
                          child: Text(
                            locationName ??
                                'Loading location name...', // Displaying location name or loading text
                            style: CustomTextStyles
                                .bodyMediumBentonSansMediumBlack900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 26.h),
          CustomElevatedButton(
            text: "lbl_set_location".tr,
            buttonStyle: CustomButtonStyles.fillWhiteA.copyWith(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            buttonTextStyle: CustomTextStyles.bodyMediumRubikOnErrorContainer,
            onPressed: () {
              BlocProvider.of<SetLocationBloc>(context)
                  .add(SetLocationButtonPressedEvent(context));
            },
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen
  void onTapVectorOne(BuildContext context) {
    NavigatorService.goBack();
  }
}
