import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_export.dart';
import '../models/set_location_model.dart';

part 'set_location_event.dart';
part 'set_location_state.dart';

class SetLocationBloc extends Bloc<SetLocationEvent, SetLocationState> {
  SetLocationBloc(super.initialState) {
    on<SetLocationInitialEvent>(_onInitialize);
    on<SetLocationButtonPressedEvent>(_onSetLocationButtonPressed);
  }

  Future<void> _onInitialize(
    SetLocationInitialEvent event,
    Emitter<SetLocationState> emit,
  ) async {
    // Your logic here
  }

  // In your SetLocationBloc class
  Future<void> _onSetLocationButtonPressed(
    SetLocationButtonPressedEvent event,
    Emitter<SetLocationState> emit,
  ) async {
    LatLng? selectedLocation =
        await NavigatorService.openGoogleMaps(event.context);

    if (selectedLocation != null) {
      // Get the location name from the selected coordinates
      String locationName = await getLocationNameFromLatLng(selectedLocation);

      emit(state.copyWith(
        setLocationModelObj: SetLocationModel(
          location: selectedLocation,
          locationName: locationName,
        ),
      ));
    }
  }

  Future<String> getLocationNameFromLatLng(LatLng latLng) async {
    try {
      // Get the list of placemarks from the coordinates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      // Check if we have at least one placemark
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first; // Get the first placemark

        // Create a formatted address or just use the place name
        String locationName =
            '${place.locality}, ${place.administrativeArea}, ${place.country}';
        return locationName;
      } else {
        return "Location not found";
      }
    } catch (e) {
      print("Error fetching location name: $e");
      return "Error fetching location";
    }
  }
}













// Add this import at the top of the file

// Modify SetLocationState
// class SetLocationState extends Equatable {
//   SetLocationState({this.setLocationModelObj, this.selectedLocation});

//   SetLocationModel? setLocationModelObj;
//   LatLng? selectedLocation; // Add this field to hold selected location

//   @override
//   List<Object?> get props => [setLocationModelObj, selectedLocation];

//   SetLocationState copyWith({
//     SetLocationModel? setLocationModelObj,
//     LatLng? selectedLocation,
//   }) {
//     return SetLocationState(
//       setLocationModelObj: setLocationModelObj ?? this.setLocationModelObj,
//       selectedLocation: selectedLocation ?? this.selectedLocation,
//     );
//   }
// }

// // Update your event handler
// Future<void> _onSetLocationButtonPressed(
//   SetLocationButtonPressedEvent event,
//   Emitter<SetLocationState> emit,
// ) async {
//   // Open Google Maps and get the selected location
//   LatLng? selectedLocation = await openGoogleMaps();

//   // Update the state with the selected location if not null
//   if (selectedLocation != null) {
//     emit(state.copyWith(setLocationModelObj: SetLocationModel(location: selectedLocation))); // Update state with selected location
//   }
// }

// /// A bloc that manages the state of a SetLocation according to the event that is dispatched to it.
