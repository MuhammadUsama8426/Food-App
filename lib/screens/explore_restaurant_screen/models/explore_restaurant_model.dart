import 'package:equatable/equatable.dart';

import 'gridvegan_resto_item_model.dart';

/// This class defines the variables used in the [explore_restaurant_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable

class ExploreRestaurantModel extends Equatable {
  ExploreRestaurantModel({this.gridveganRestoItemList = const []});

  List<GridveganRestoItemModel> gridveganRestoItemList;

  ExploreRestaurantModel copyWith({
    List<GridveganRestoItemModel>? gridveganRestoItemList,
  }) {
    return ExploreRestaurantModel(
      gridveganRestoItemList:
          gridveganRestoItemList ?? this.gridveganRestoItemList,
    );
  }

  @override
  List<Object?> get props => [gridveganRestoItemList];
}
