// part of 'set_location_bloc.dart';

// /// Represents the state of SetLocation in the application.
// class SetLocationState extends Equatable {
//   SetLocationState({this.setLocationModelObj});

//   SetLocationModel? setLocationModelObj;

//   @override
//   List<Object?> get props => [setLocationModelObj];

//   SetLocationState copyWith({SetLocationModel? setLocationModelObj}) {
//     return SetLocationState(
//       setLocationModelObj: setLocationModelObj ?? this.setLocationModelObj,
//     );
//   }
// }
part of 'set_location_bloc.dart';

class SetLocationState extends Equatable {
  final SetLocationModel? setLocationModelObj;
  final LatLng? selectedLocation; // Add this field to hold selected location

  const SetLocationState({this.setLocationModelObj, this.selectedLocation});

  @override
  List<Object?> get props => [setLocationModelObj, selectedLocation];

  SetLocationState copyWith({
    SetLocationModel? setLocationModelObj,
    LatLng? selectedLocation,
  }) {
    return SetLocationState(
      setLocationModelObj: setLocationModelObj ?? this.setLocationModelObj,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }
}
