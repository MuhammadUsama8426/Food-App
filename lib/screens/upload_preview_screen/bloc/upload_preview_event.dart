part of 'upload_preview_bloc.dart';

/// Abstract class for all events that can be dispatched from the UploadPreview widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class UploadPreviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the UploadPreview widget is first created.
class UploadPreviewInitialEvent extends UploadPreviewEvent {}



















// part of 'upload_preview_bloc.dart';

// /// Abstract class for all events that can be dispatched from the UploadPreview widget.
// /// Events must be immutable and implement the [Equatable] interface.
// abstract class UploadPreviewEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// /// Event that is dispatched when the UploadPreview widget is first created.
// class UploadPreviewInitialEvent extends UploadPreviewEvent {
//   @override
//   List<Object?> get props => [];
// }
