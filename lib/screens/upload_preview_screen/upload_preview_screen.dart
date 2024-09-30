import 'package:flutter/material.dart';
import 'package:my_food_app/theme/custom_button_style.dart';
import 'package:my_food_app/widgets/custom_elevated_button.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class UploadPreviewScreen extends StatelessWidget {
  final String downloadUrl;

  const UploadPreviewScreen({super.key, required this.downloadUrl});
  static Widget builder(BuildContext context, String imageUrl) {
    return UploadPreviewScreen(
      downloadUrl: imageUrl,
    );
  }
  // Use this builder to wrap UploadPreviewScreen with the BlocProvider
  // static Widget builder(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => UploadPreviewBloc(
  //       UploadPreviewState(uploadPreviewModelObj: const UploadPreviewModel()),
  //     )..add(UploadPreviewInitialEvent()),
  //     child: const UploadPreviewScreen(
  //       downloadUrl: '',
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // BlocBuilder to rebuild the UI when the state changes
    // return BlocBuilder<UploadPreviewBloc, UploadPreviewState>(
    // builder: (context, state) {
    // final uploadPreviewModel = state.uploadPreviewModelObj;
    // final imagePath = uploadPreviewModel?.imageUrl ?? downloadUrl;
    final imagePath =
        downloadUrl; // Assuming downloadUrl contains the image URL

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStackTitleOne(context),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 25.h),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (imagePath.isNotEmpty)
                                  Image.network(
                                    imagePath,
                                    height: 238,
                                    width: 245,
                                    fit: BoxFit.cover,
                                  )
                                else
                                  const CircularProgressIndicator(), // Show loader if imagePath is empty or null
                                SizedBox(height: 20.h),
                                CustomElevatedButton(
                                  width: 156.h,
                                  text: "lbl_next".tr,
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientGreenAToPrimaryDecoration,
                                ),
                              ],
                            ),
                          ),
                        ],
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
  }

  Widget buildStackTitleOne(BuildContext context) {
    return SizedBox(
      height: 228,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup186x340,
            height: 186,
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 8),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 226,
                  child: Text(
                    "Upload Your Photo Profile",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          height: 1.31,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 228,
                  child: Text(
                    "This data will be displayed in your account profile for security",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBentonSansBookBlack9000112
                        .copyWith(
                      height: 1.81,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomAppBar(
            leadingWidth: 44,
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

  void onTapVectorOne(BuildContext context) {
    NavigatorService.goBack();
  }
}



















// import 'package:flutter/material.dart';
// import 'package:my_food_app/theme/custom_button_style.dart';
// import 'package:my_food_app/widgets/custom_elevated_button.dart';

// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import 'bloc/upload_preview_bloc.dart';
// import 'models/upload_preview_model.dart';

// class UploadPreviewScreen extends StatelessWidget {
//   final String downloadUrl;

//   const UploadPreviewScreen({super.key, required this.downloadUrl});

//   static Widget builder(BuildContext context) {
//     return BlocProvider<UploadPreviewBloc>(
//       create: (context) => UploadPreviewBloc(
//         UploadPreviewState(uploadPreviewModelObj: const UploadPreviewModel()),
//       )..add(UploadPreviewInitialEvent()),
//       child: const UploadPreviewScreen(
//         downloadUrl: '',
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UploadPreviewBloc, UploadPreviewState>(
//       builder: (context, state) {
//         final uploadPreviewModel = state.uploadPreviewModelObj;
//         final imagePath = uploadPreviewModel!.imageUrl ??
//             downloadUrl; // Use downloadUrl if imageUrl is null

//         return SafeArea(
//           child: Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildStackTitleOne(context),
//                   Container(
//                     width: double.maxFinite,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 14.h, vertical: 25.h),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: double.maxFinite,
//                           padding: EdgeInsets.symmetric(horizontal: 50.h),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: double.maxFinite,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     if (imagePath.isNotEmpty)
//                                       Image.network(
//                                         imagePath,
//                                         height: 238,
//                                         width: 245,
//                                         fit: BoxFit.cover,
//                                       )
//                                     else
//                                       const CircularProgressIndicator(), // Show loader if imagePath is empty or null
//                                     SizedBox(
//                                         height: 20.h), // Add space after image
//                                     CustomElevatedButton(
//                                       width: 156.h,
//                                       text: "lbl_next".tr,
//                                       buttonStyle: CustomButtonStyles.none,
//                                       decoration: CustomButtonStyles
//                                           .gradientGreenAToPrimaryDecoration,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget buildStackTitleOne(BuildContext context) {
//     return SizedBox(
//       height: 228, // Fixed height for the header section
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.bottomLeft,
//         children: [
//           // Background image
//           CustomImageView(
//             imagePath: ImageConstant.imgGroup186x340,
//             height: 186,
//             width: double.maxFinite,
//             alignment: Alignment.topLeft,
//             margin: const EdgeInsets.only(left: 8),
//           ),
//           // Title and description text
//           Padding(
//             padding: const EdgeInsets.only(left: 24, bottom: 16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 226,
//                   child: Text(
//                     "Upload Your Photo Profile",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           height: 1.31,
//                         ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 228,
//                   child: Text(
//                     "This data will be displayed in your account profile for security",
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: CustomTextStyles.bodySmallBentonSansBookBlack9000112
//                         .copyWith(
//                       height: 1.81,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // App bar with back button
//           CustomAppBar(
//             leadingWidth: 44,
//             leading: AppbarLeadingIconButton(
//               imagePath: ImageConstant.imgVector,
//               onTap: () {
//                 onTapVectorOne(context);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Navigates to the previous screen.
//   void onTapVectorOne(BuildContext context) {
//     NavigatorService.goBack();
//   }
// }
