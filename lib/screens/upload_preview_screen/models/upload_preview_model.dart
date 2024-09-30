import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [upload_preview_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UploadPreviewModel extends Equatable {
  final String? imageUrl;

  const UploadPreviewModel({this.imageUrl});

  UploadPreviewModel copyWith({String? imageUrl}) {
    return UploadPreviewModel(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [imageUrl];
}


























// import 'package:equatable/equatable.dart';

// /// This class defines the variables used in the [upload_preview_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// class UploadPreviewModel extends Equatable {
//   final String? imageUrl;

//   const UploadPreviewModel({this.imageUrl});

//   UploadPreviewModel copyWith({String? imageUrl}) {
//     return UploadPreviewModel(
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }

//   @override
//   List<Object?> get props => [imageUrl];
// }
