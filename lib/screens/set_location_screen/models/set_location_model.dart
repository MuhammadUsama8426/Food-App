import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationModel extends Equatable {
  final LatLng? location;
  final String? locationName; // Add this field for the location name

  const SetLocationModel(
      {this.location, this.locationName}); // Update constructor

  SetLocationModel copyWith({LatLng? location, String? locationName}) {
    return SetLocationModel(
      location: location ?? this.location,
      locationName: locationName ?? this.locationName, // Update copyWith
    );
  }

  @override
  List<Object?> get props => [location, locationName]; // Update props
}
















// import 'package:equatable/equatable.dart';

// /// This class defines the variables used in the [set_location_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// class SetLocationModel extends Equatable {
//   const SetLocationModel();

//   SetLocationModel copyWith() {
//     return const SetLocationModel();
//   }

//   @override
//   List<Object?> get props => [];
// }


