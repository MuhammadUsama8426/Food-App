import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/gridvegan_resto_item_model.dart';

// ignore_for_file: must_be_immutable

class GridveganRestoItemWidget extends StatelessWidget {
  final GridveganRestoItemModel gridveganRestoItemModelObj;

  const GridveganRestoItemWidget(this.gridveganRestoItemModelObj, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 26.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadiusStyle.roundedBorder22,
        boxShadow: [
          BoxShadow(
            color: appTheme.indigoA20011,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(1, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: gridveganRestoItemModelObj.veganRestoOne!,
            height: 72.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 8.h),
          ),
          SizedBox(height: 16.h),
          Text(
            gridveganRestoItemModelObj.restoname!,
            style: CustomTextStyles.bodyLargeBlack90001,
          ),
          SizedBox(height: 2.h),
          Text(
            gridveganRestoItemModelObj.time!,
            style: CustomTextStyles.bodyMediumBentonSansBookBlack90001,
          ),
        ],
      ),
    );
  }
}
