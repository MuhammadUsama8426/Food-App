import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:my_food_app/widgets/custom_button_bar.dart';
import 'package:my_food_app/widgets/custom_icon_button.dart';
import 'package:my_food_app/widgets/custom_search_view.dart';

import 'bloc/explore_restaurant_bloc.dart';
import 'models/explore_restaurant_model.dart';
import 'models/gridvegan_resto_item_model.dart';
import 'widgets/gridvegan_resto_item_widget.dart';

class ExploreRestaurantScreen extends StatelessWidget {
  ExploreRestaurantScreen({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ExploreRestaurantBloc>(
      create: (context) => ExploreRestaurantBloc(
        ExploreRestaurantState(
          exploreRestaurantModelObj: ExploreRestaurantModel(),
        ),
      )..add(ExploreRestaurantInitialEvent()),
      child: ExploreRestaurantScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              buildStackIconOne(context),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.h),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     margin: EdgeInsets.only(left: 16.h),
                      //     padding: EdgeInsets.symmetric(
                      //       vertical: 10.h,
                      //       horizontal: 20.h,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: appTheme.whiteA70001,
                      //       borderRadius: BorderRadius.circular(22.h),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: appTheme.indigoA20011,
                      //           spreadRadius: 2.h,
                      //           blurRadius: 2.h,
                      //           offset: Offset(1, 2),
                      //         ),
                      //       ],
                      //     ),
                      //     child: Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         CustomImageView(
                      //           imagePath:
                      //               ImageConstant.imgRestaurantImage94x100,
                      //           height: 94.h,
                      //           width: double.infinity,
                      //           margin: EdgeInsets.only(right: 4.h),
                      //         ),
                      //         SizedBox(height: 10.h),
                      //         Text(
                      //           "lbl_vegan_resto".tr,
                      //           style: CustomTextStyles.bodyLargeBlack90001,
                      //         ),
                      //         SizedBox(height: 4.h),
                      //         Text(
                      //           "lbl_12_mins".tr,
                      //           style: CustomTextStyles
                      //               .bodyMediumBentonSansBookBlack90001,
                      //         ),
                      //         SizedBox(height: 14.h),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      buildGridVeganResto(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: buildBottomBar(context),
        ),
      ),
    );
  }

  Widget buildStackIconOne(BuildContext context) {
    return Container(
      height: 325.h,
      width: double.infinity,
      margin: EdgeInsets.only(left: 24.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.h),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Stack(
                children: [
                  // Original Image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup186x340),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // BackdropFilter for blur effect and white overlay
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 3.0, sigmaY: 3.0), // Adjust blur strength
                    child: Container(
                      color: Colors.white
                          .withOpacity(0.8), // Adjust opacity for white overlay
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20.h,
            bottom: 38.h,
            child: CustomIconButton(
              height: 50.h,
              width: 48.h,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgCloseDeepOrange70050x48,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.h),
                        child: Text(
                          "msg_find_your_favorite".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.headlineLarge?.copyWith(
                            height: 1.31,
                          ),
                        ),
                      ),
                    ),
                    AppbarTrailingImage(
                      imagePath: ImageConstant.imgIconNotification,
                      margin: EdgeInsets.only(right: 39.h),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Search bar
                Align(
                  alignment: Alignment.center,
                  child: BlocSelector<ExploreRestaurantBloc,
                      ExploreRestaurantState, TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomSearchBar(
                              margin: EdgeInsets.only(left: 5),
                              contentPadding:
                                  EdgeInsets.fromLTRB(18.h, 12.h, 12.h, 12.h),
                              controller: searchController,
                              hintText: "msg_what_do_you_want".tr,
                              prefix: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgIconSearch,
                                  height: 24.h,
                                  width: 24.h,
                                ),
                              ),
                              suffix: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                  onPressed: () => searchController?.clear(),
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Filter Icon
                          IconButton(
                            onPressed: () {
                              // Add your filter action here
                            },
                            icon: Icon(
                              Icons
                                  .filter_list, // You can choose your preferred filter icon
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                // Popular text line
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.h),
                  child: Text(
                    "msg_popular_restaurant".tr,
                    style: CustomTextStyles.bodyMediumBentonSansBoldBlack900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridVeganResto(BuildContext context) {
    return BlocSelector<ExploreRestaurantBloc, ExploreRestaurantState,
        ExploreRestaurantModel?>(
      selector: (state) => state.exploreRestaurantModelObj,
      builder: (context, exploreRestaurantModelObj) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1,
          ),
          itemCount:
              exploreRestaurantModelObj?.gridveganRestoItemList.length ?? 0,
          itemBuilder: (context, index) {
            GridveganRestoItemModel model =
                exploreRestaurantModelObj?.gridveganRestoItemList[index] ??
                    GridveganRestoItemModel();
            return GridveganRestoItemWidget(model);
          },
        );
      },
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
            navigatorKey.currentContext!,
            getCurrentRoute(type),
          );
        },
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.homeInitialPage;
      default:
        return "/";
    }
  }
}
