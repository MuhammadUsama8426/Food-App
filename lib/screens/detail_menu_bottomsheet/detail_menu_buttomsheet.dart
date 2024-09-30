import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/theme/custom_button_style.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'bloc/detail_menu_bloc.dart';
import 'models/detail_menu_model.dart';

class DetailMenuBottomsheet extends StatelessWidget {
  const DetailMenuBottomsheet({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailMenuBloc(
        DetailMenuState(detailMenuModelObj: const DetailMenuModel()),
      )..add(DetailMenuInitialEvent()),
      child: const DetailMenuBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadiusStyle.customBorderTL72,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18.h),
          SizedBox(width: 58.h, child: const Divider()),
          SizedBox(height: 36.h),
          buildRowPopular(context),
          SizedBox(height: 18.h),
          buildStackRatingCount(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildRowPopular(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            height: 34.h,
            width: 76.h,
            text: "lbl_popular".tr,
            buttonStyle: CustomButtonStyles.none,
            decoration:
                CustomButtonStyles.gradientGreenAToPrimaryTL16Decoration,
            buttonTextStyle:
                CustomTextStyles.bodySmallBentonSansMediumGreenA200,
          ),
          const Spacer(),
          CustomIconButton(
            height: 34.h,
            width: 34.h,
            padding: EdgeInsets.all(6.h),
            decoration: IconButtonStyleHelper.gradientGreenAToPrimaryTL16,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconLocation,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: CustomIconButton(
              height: 34.h,
              width: 34.h,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillRedATL16,
              child: CustomImageView(
                imagePath: ImageConstant.imgHeart,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildStackRatingCount(BuildContext context) {
    return SizedBox(
      height: 342.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          IntrinsicHeight(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 16.h,
                margin: EdgeInsets.only(left: 8.h, top: 90.h, right: 8.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIconStar,
                      height: 16.h,
                      width: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "lbl_4_8_rating".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 88.h, right: 82.h),
              child: Text(
                "lbl_2000_order".tr,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 248.h,
                  margin: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "msg_rainbow_sandwich".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineMedium!.copyWith(
                      height: 1.31,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomImageView(
                  imagePath: ImageConstant.imgShoppingBag1,
                  height: 20.h,
                  width: 20.h,
                  margin: EdgeInsets.only(left: 122.h),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "msg_nulla_occaecat_velit".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBentonSansBookBlack9000112
                        .copyWith(
                      height: 1.81,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  text: "lbl_add_to_chart".tr,
                  margin: EdgeInsets.only(bottom: 18.h),
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientGreenAToPrimaryTL14Decoration,
                  buttonTextStyle:
                      CustomTextStyles.bodyMediumBentonSansBoldWhiteA70002,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
