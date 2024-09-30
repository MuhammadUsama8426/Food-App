import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
import '../models/listfrom_item_model.dart';
import '../models/upload_photo_model.dart';

part 'upload_photo_event.dart';
part 'upload_photo_state.dart';

class UploadPhotoBloc extends Bloc<UploadPhotoEvent, UploadPhotoState> {
  UploadPhotoBloc(UploadPhotoState uploadPhotoState)
      : super(UploadPhotoState(uploadPhotoModel0bj: UploadPhotoModel())) {
    on<UploadPhotoInitialEvent>(_onInitialize);
    on<SelectGalleryImageEvent>(_onSelectGalleryImage);
    on<TakePhotoEvent>(_onTakePhoto);
    on<SaveImageToFirestoreEvent>(_onSaveImageToFirestore);
  }

  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _onInitialize(
      UploadPhotoInitialEvent event, Emitter<UploadPhotoState> emit) {
    emit(state.copyWith(
      uploadPhotoModel0bj: UploadPhotoModel(
        listfromItemList: fillListFromItemList(),
      ),
    ));
  }

  Future<void> _onSelectGalleryImage(
      SelectGalleryImageEvent event, Emitter<UploadPhotoState> emit) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String? downloadUrl = await _uploadToFirebase(imageFile);

      emit(state.copyWith(
        uploadPhotoModel0bj: state.uploadPhotoModel0bj?.copyWith(
          selectedImagePath: imageFile,
          downloadUrl: downloadUrl,
        ),
      ));

      if (downloadUrl != null) {
        add(SaveImageToFirestoreEvent(downloadUrl: downloadUrl));
      }
    }
  }

  Future<void> _onTakePhoto(
      TakePhotoEvent event, Emitter<UploadPhotoState> emit) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String? downloadUrl = await _uploadToFirebase(imageFile);

      emit(state.copyWith(
        uploadPhotoModel0bj: state.uploadPhotoModel0bj?.copyWith(
          selectedImagePath: imageFile,
          downloadUrl: downloadUrl,
        ),
      ));

      if (downloadUrl != null) {
        add(SaveImageToFirestoreEvent(downloadUrl: downloadUrl));
      }
    }
  }

  Future<void> _onSaveImageToFirestore(
      SaveImageToFirestoreEvent event, Emitter<UploadPhotoState> emit) async {
    try {
      await _firestore.collection('images').add({
        'url': event.downloadUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error saving image to Firestore: $e");
    }
  }

  Future<String?> _uploadToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('uploads/$fileName');

      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  List<ListfromItemModel> fillListFromItemList() {
    return [
      ListfromItemModel(
        fromGallery: ImageConstant.imgGallery,
        orderdetails: "From Gallery",
      ),
      ListfromItemModel(
        fromGallery: ImageConstant.imgTelevision,
        orderdetails: "Take Photo",
      ),
    ];
  }
}


















// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/app_export.dart';
// import '../models/listfrom_item_model.dart';
// import '../models/upload_photo_model.dart';

// part 'upload_photo_event.dart';
// part 'upload_photo_state.dart';

// /// A bloc that manages the state of UploadPhoto according to the events that are dispatched to it.
// class UploadPhotoBloc extends Bloc<UploadPhotoEvent, UploadPhotoState> {
//   UploadPhotoBloc(super.initialState) {
//     on<UploadPhotoInitialEvent>(_onInitialize);
//     on<SelectGalleryImageEvent>(_onSelectGalleryImage);
//     on<TakePhotoEvent>(_onTakePhoto);
    
//   }
//   final ImagePicker _picker = ImagePicker();
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final FirebaseFirestore _firestore =
//       FirebaseFirestore.instance; // Firestore instance

//   void _onInitialize(
//     UploadPhotoInitialEvent event,
//     Emitter<UploadPhotoState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         uploadPhotoModel0bj: UploadPhotoModel(
//           listfromItemList: fillListFromItemList(),
//         ),
//       ),
//     );
//   }

//   void _onSelectGalleryImage(
//     SelectGalleryImageEvent event,
//     Emitter<UploadPhotoState> emit,
//   ) async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       String? downloadUrl = await _uploadToFirebase(imageFile);
//       // Do something with the image (e.g., update the state)
//       // Example: emit the state with the selected image path
//       emit(state.copyWith(
//         uploadPhotoModel0bj: state.uploadPhotoModel0bj?.copyWith(
//           // selectedImagePath: File(pickedFile.path),
//           selectedImagePath: imageFile,
//           downloadUrl: downloadUrl,
//         ),
//       ));
//     }
//   }

//   void _onTakePhoto(
//     TakePhotoEvent event,
//     Emitter<UploadPhotoState> emit,
//   ) async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       String? downloadUrl = await _uploadToFirebase(imageFile);

//       emit(state.copyWith(
//         uploadPhotoModel0bj: state.uploadPhotoModel0bj?.copyWith(
//           // selectedImagePath: File(pickedFile.path),
//           selectedImagePath: imageFile,
//           downloadUrl: downloadUrl,
//         ),
//       ));
//     }
//   }
// }

// // Initialize FirebaseStorage instance
// final FirebaseStorage _storage = FirebaseStorage.instance;

// Future<String?> _uploadToFirebase(File imageFile) async {
//   try {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();

//     // Correct usage with 'Reference'
//     Reference ref = _storage.ref().child('uploads/$fileName');

//     // Upload the file to Firebase Storage
//     UploadTask uploadTask = ref.putFile(imageFile);

//     // Wait until the upload completes
//     TaskSnapshot snapshot = await uploadTask;

//     // Get the download URL for the uploaded file
//     return await snapshot.ref.getDownloadURL();
//   } catch (e) {
//     print("Error uploading image: $e");
//     return null;
//   }
// }

// List<ListfromItemModel> fillListFromItemList() {
//   return [
//     ListfromItemModel(
//       fromGallery: ImageConstant.imgGallery,
//       orderdetails: "From Gallery",
//     ),
//     ListfromItemModel(
//       fromGallery: ImageConstant.imgTelevision,
//       orderdetails: "Take Photo",
//     ),
//   ];
// }
