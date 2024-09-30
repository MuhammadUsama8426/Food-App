import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/screens/upload_preview_screen/upload_preview_screen.dart';

import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/upload_photo_bloc.dart';
import 'models/listfrom_item_model.dart';
import 'models/upload_photo_model.dart';
import 'widgets/listfrom_item_widget.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<UploadPhotoBloc>(
      create: (context) => UploadPhotoBloc(
        UploadPhotoState(uploadPhotoModel0bj: UploadPhotoModel()),
      )..add(UploadPhotoInitialEvent()),
      child: const UploadPhotoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            buildStackTitleOne(context),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
              child: Column(
                children: [
                  buildListFrom(context),
                  const SizedBox(height: 164),
                  BlocBuilder<UploadPhotoBloc, UploadPhotoState>(
                    builder: (context, state) {
                      String? uploadedImageUrl =
                          state.uploadPhotoModel0bj?.downloadUrl;
                      return CustomElevatedButton(
                        width: 156,
                        text: "Next",
                        buttonStyle: CustomButtonStyles.none,
                        onPressed: () {
                          if (uploadedImageUrl != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadPreviewScreen(
                                  downloadUrl: uploadedImageUrl,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please upload an image!")),
                            );
                          }
                        },
                        decoration: CustomButtonStyles
                            .gradientGreenAToPrimaryDecoration,
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  /// Section Widget (Fixed Background/Title)
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
                    "This data will be displayed in your profile for security.",
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

  /// Section Widget for the list of items
  Widget buildListFrom(BuildContext context) {
    return BlocSelector<UploadPhotoBloc, UploadPhotoState, UploadPhotoModel?>(
      selector: (state) => state.uploadPhotoModel0bj,
      builder: (context, uploadPhotoModelObj) {
        return Column(children: [
          if (uploadPhotoModelObj?.selectedImagePath != null)
            Image.file(
              uploadPhotoModelObj!.selectedImagePath!,
              height: 200, // Adjust size
            ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: uploadPhotoModelObj?.listfromItemList.length ?? 0,
            itemBuilder: (context, index) {
              ListfromItemModel model =
                  uploadPhotoModelObj?.listfromItemList[index] ??
                      ListfromItemModel();
              return ListfromItemWidget(model);
            },
          )
        ]);
      },
    );
  }

  void onTapVectorOne(BuildContext context) {
    NavigatorService.goBack();
  }
}


























// import 'package:flutter/material.dart';
// import 'package:my_food_app/core/app_export.dart';
// import 'package:my_food_app/screens/upload_preview_screen/upload_preview_screen.dart';

// import '../../theme/custom_button_style.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_elevated_button.dart';
// import 'bloc/upload_photo_bloc.dart';
// import 'models/listfrom_item_model.dart';
// import 'models/upload_photo_model.dart';
// import 'widgets/listfrom_item_widget.dart';

// class UploadPhotoScreen extends StatelessWidget {
//   const UploadPhotoScreen({super.key});

//   static Widget builder(BuildContext context) {
//     return BlocProvider<UploadPhotoBloc>(
//       create: (context) => UploadPhotoBloc(
//         UploadPhotoState(uploadPhotoModel0bj: UploadPhotoModel()),
//       )..add(UploadPhotoInitialEvent()),
//       child: const UploadPhotoScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildStackTitleOne(context),
//               buildContent(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildContent(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 22,
//       ),
//       child: Column(
//         children: [
//           // List of items
//           buildListFrom(context),
//           const SizedBox(height: 164),

//           BlocBuilder<UploadPhotoBloc, UploadPhotoState>(
//             builder: (context, state) {
//               String? uploadedImageUrl = state.uploadPhotoModel0bj?.downloadUrl;

//               return CustomElevatedButton(
//                 width: 156,
//                 text: "Next",
//                 buttonStyle: CustomButtonStyles.none,
//                 onPressed: () {
//                   // Ensure that the image is uploaded before navigating
//                   if (uploadedImageUrl != null) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UploadPreviewScreen(
//                           downloadUrl: uploadedImageUrl,
//                         ),
//                       ),
//                     );
//                   } else {
//                     // Handle error (maybe show a SnackBar or Alert)
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text("Please upload an image first!")),
//                     );
//                   }
//                 },
//                 decoration:
//                     CustomButtonStyles.gradientGreenAToPrimaryDecoration,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget (Fixed Background/Title)
//   Widget buildStackTitleOne(BuildContext context) {
//     return SizedBox(
//       height: 228,
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

//   /// Section Widget for the list of items
//   Widget buildListFrom(BuildContext context) {
//     return BlocSelector<UploadPhotoBloc, UploadPhotoState, UploadPhotoModel?>(
//       selector: (state) => state.uploadPhotoModel0bj,
//       builder: (context, uploadPhotoModelObj) {
//         return Column(
//           children: [
//             if (uploadPhotoModelObj?.selectedImagePath != null)
//               Image.file(
//                 uploadPhotoModelObj!.selectedImagePath!,
//                 height: 200,
//               ),
//             if (uploadPhotoModelObj?.downloadUrl != null)
//               // Text("Uploaded to Firebase: ${uploadPhotoModelObj?.downloadUrl}"),
//               ListView.separated(
//                 padding: EdgeInsets.zero,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) {
//                   return const SizedBox(height: 20);
//                 },
//                 itemCount: uploadPhotoModelObj?.listfromItemList.length ?? 0,
//                 itemBuilder: (context, index) {
//                   ListfromItemModel model =
//                       uploadPhotoModelObj?.listfromItemList[index] ??
//                           ListfromItemModel();
//                   return ListfromItemWidget(model);
//                 },
//               ),
//           ],
//         );
//       },
//     );
//   }

//   /// Navigates to the previous screen.
//   void onTapVectorOne(BuildContext context) {
//     NavigatorService.goBack();
//   }
// }































