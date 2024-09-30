import 'dart:io';

import 'listfrom_item_model.dart';

class UploadPhotoModel {
  File? selectedImagePath;
  String? downloadUrl;
  List<ListfromItemModel> listfromItemList;

  UploadPhotoModel({
    this.selectedImagePath,
    this.downloadUrl,
    this.listfromItemList = const [],
  });

  UploadPhotoModel copyWith({
    File? selectedImagePath,
    String? downloadUrl,
    List<ListfromItemModel>? listfromItemList,
  }) {
    return UploadPhotoModel(
      selectedImagePath: selectedImagePath ?? this.selectedImagePath,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      listfromItemList: listfromItemList ?? this.listfromItemList,
    );
  }
}









































// import 'dart:io';

// import 'package:equatable/equatable.dart';

// import 'listfrom_item_model.dart';

// /// This class defines the variables used in the [UploadPhotoScreen],
// /// and is typically used to hold data that is passed between different parts of the application.
// class UploadPhotoModel extends Equatable {
//   UploadPhotoModel({
//     this.listfromItemList = const [],
//     this.selectedImagePath,
//         this.downloadUrl,

//   });

//   List<ListfromItemModel> listfromItemList;
//   File? selectedImagePath; // Add the selected image path

//   UploadPhotoModel copyWith({
//     List<ListfromItemModel>? listfromItemList,
//         String? downloadUrl,
//     String? downloadUrl,

//     File? selectedImagePath,
//   }) {
//     return UploadPhotoModel(
//       listfromItemList: listfromItemList ?? this.listfromItemList,
//             downloadUrl: downloadUrl ?? this.downloadUrl,

//       selectedImagePath: selectedImagePath ?? this.selectedImagePath,
//     );
//   }

//   @override
//   // List<Object?> get props => [listfromItemList];
//   List<Object?> get props => [listfromItemList, selectedImagePath];
// }
