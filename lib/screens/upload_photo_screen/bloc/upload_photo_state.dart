part of 'upload_photo_bloc.dart';

class UploadPhotoState extends Equatable {
  final UploadPhotoModel? uploadPhotoModel0bj;

  const UploadPhotoState({this.uploadPhotoModel0bj});

  @override
  List<Object?> get props => [uploadPhotoModel0bj];

  UploadPhotoState copyWith({
    UploadPhotoModel? uploadPhotoModel0bj,
  }) {
    return UploadPhotoState(
      uploadPhotoModel0bj: uploadPhotoModel0bj ?? this.uploadPhotoModel0bj,
    );
  }
}






















// part of 'upload_photo_bloc.dart';

// /// Represents the state of UploadPhoto in the application.
// ///
// /// This state contains the [UploadPhotoModel] object.
// class UploadPhotoState extends Equatable {
//   UploadPhotoState({this.uploadPhotoModel0bj});

//   /// The model object that holds the state data for upload photo.
//   UploadPhotoModel? uploadPhotoModel0bj;

//   @override
//   List<Object?> get props => [uploadPhotoModel0bj];

//   /// Creates a copy of this state with optional updated fields.
//   UploadPhotoState copyWith({UploadPhotoModel? uploadPhotoModel0bj}) {
//     return UploadPhotoState(
//       uploadPhotoModel0bj: uploadPhotoModel0bj ?? this.uploadPhotoModel0bj,
//     );
//   }
// }
