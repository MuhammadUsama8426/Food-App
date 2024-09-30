part of 'explore_restaurant_bloc.dart';

/// Represents the state of ExploreRestaurant in the application.
// ignore_for_file: must_be_immutable
class ExploreRestaurantState extends Equatable {
  ExploreRestaurantState({
    this.searchController,
    this.exploreRestaurantModelObj,
  });

  TextEditingController? searchController;
  ExploreRestaurantModel? exploreRestaurantModelObj;

  @override
  List<Object?> get props => [searchController, exploreRestaurantModelObj];

  ExploreRestaurantState copyWith({
    TextEditingController? searchController,
    ExploreRestaurantModel? exploreRestaurantModelObj,
  }) {
    return ExploreRestaurantState(
      searchController: searchController ?? this.searchController,
      exploreRestaurantModelObj:
          exploreRestaurantModelObj ?? this.exploreRestaurantModelObj,
    );
  }
}
