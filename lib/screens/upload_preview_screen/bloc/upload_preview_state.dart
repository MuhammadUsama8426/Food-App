part of 'upload_preview_bloc.dart';

/// Represents the state of UploadPreview in the application.
// ignore_for_file: must_be_immutable
class UploadPreviewState extends Equatable {
  UploadPreviewState({this.uploadPreviewModelObj});

  UploadPreviewModel? uploadPreviewModelObj;

  @override
  List<Object?> get props => [uploadPreviewModelObj];

  UploadPreviewState copyWith({UploadPreviewModel? uploadPreviewModelObj}) {
    return UploadPreviewState(
      uploadPreviewModelObj:
          uploadPreviewModelObj ?? this.uploadPreviewModelObj,
    );
  }
}





















// part of 'upload_preview_bloc.dart';

// /// Represents the state of UploadPreview in the application.
// // ignore_for_file: must_be_immutable
// class UploadPreviewState extends Equatable {
//   UploadPreviewState({this.uploadPreviewModelObj});

//   UploadPreviewModel? uploadPreviewModelObj;

//   @override
//   List<Object?> get props => [uploadPreviewModelObj];

//   UploadPreviewState copyWith({UploadPreviewModel? uploadPreviewModelObj}) {
//     return UploadPreviewState(
//       uploadPreviewModelObj:
//           uploadPreviewModelObj ?? this.uploadPreviewModelObj,
//     );
//   }
// }
