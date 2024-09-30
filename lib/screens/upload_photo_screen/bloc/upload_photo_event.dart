part of 'upload_photo_bloc.dart';

abstract class UploadPhotoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadPhotoInitialEvent extends UploadPhotoEvent {}

class SelectGalleryImageEvent extends UploadPhotoEvent {}

class TakePhotoEvent extends UploadPhotoEvent {}

class SaveImageToFirestoreEvent extends UploadPhotoEvent {
  final String downloadUrl;

  SaveImageToFirestoreEvent({required this.downloadUrl});

  @override
  List<Object?> get props => [downloadUrl];
}















// /// Abstract class for all events that can be dispatched from the
// /// UploadPhoto widget.
// ///
// /// Events must be immutable and implement the [Equatable] interface.
// class UploadPhotoEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// /// Event that is dispatched when the UploadPhoto widget is first created.
// // class UploadPhotoInitialEvent extends UploadPhotoEvent {
// //   @override
// //   List<Object?> get props => [];
// // }

// class UploadPhotoInitialEvent extends UploadPhotoEvent {
//   @override
//   List<Object?> get props => [];
// }

// /// Event to select an image from the gallery.
// class SelectGalleryImageEvent extends UploadPhotoEvent {
//   @override
//   List<Object?> get props => [];
// }

// /// Event to take a photo using the camera.
// class TakePhotoEvent extends UploadPhotoEvent {
//   @override
//   List<Object?> get props => [];
// }
