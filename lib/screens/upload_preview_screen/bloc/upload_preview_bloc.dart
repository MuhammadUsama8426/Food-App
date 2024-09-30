import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_export.dart';
import '../models/upload_preview_model.dart';

part 'upload_preview_event.dart';
part 'upload_preview_state.dart';

/// A bloc that manages the state of an UploadPreview according to the event that is dispatched to it.
class UploadPreviewBloc extends Bloc<UploadPreviewEvent, UploadPreviewState> {
  UploadPreviewBloc(super.initialState) {
    on<UploadPreviewInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    UploadPreviewInitialEvent event,
    Emitter<UploadPreviewState> emit,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Fetch the document containing the image URL
    DocumentSnapshot document = await firestore
        .collection(
            'your_collection_name') // replace with your actual Firestore collection
        .doc('your_document_id') // replace with your actual document ID
        .get();

    // Extract the image URL from the document
    String imageUrl =
        document['imageUrl']; // Ensure this matches your Firestore field

    // Update the state with the image URL
    emit(state.copyWith(
        uploadPreviewModelObj: UploadPreviewModel(imageUrl: imageUrl)));
  }
}




























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';

// import '../../../core/app_export.dart';
// import '../models/upload_preview_model.dart';

// part 'upload_preview_event.dart';
// part 'upload_preview_state.dart';

// /// A bloc that manages the state of an UploadPreview according to the event that is dispatched to it.
// class UploadPreviewBloc extends Bloc<UploadPreviewEvent, UploadPreviewState> {
//   UploadPreviewBloc(super.initialState) {
//     on<UploadPreviewInitialEvent>(_onInitialize);
//   }

//   Future<void> _onInitialize(
//     UploadPreviewInitialEvent event,
//     Emitter<UploadPreviewState> emit,
//   ) async {
//     // Assuming you have a Firestore instance ready
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Fetch the document containing the image URL
//     DocumentSnapshot document = await firestore
//         .collection('your_collection_name')
//         .doc('your_document_id')
//         .get();

//     // Extract the image URL from the document
//     String imageUrl =
//         document['imageUrl']; // Ensure this matches your Firestore field

//     // Update the state with the image URL
//     emit(state.copyWith(
//         uploadPreviewModelObj: UploadPreviewModel(imageUrl: imageUrl)));
//   }
// }
