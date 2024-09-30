import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/explore_restaurant_model.dart';
import '../models/gridvegan_resto_item_model.dart';

part 'explore_restaurant_event.dart';
part 'explore_restaurant_state.dart';

/// A bloc that manages the state of ExploreRestaurant according to the event that is dispatched to it.
class ExploreRestaurantBloc
    extends Bloc<ExploreRestaurantEvent, ExploreRestaurantState> {
  ExploreRestaurantBloc(super.initialState) {
    on<ExploreRestaurantInitialEvent>(_onInitialize);
  }

  List<GridveganRestoItemModel> fillGridveganRestoItemList() {
    return [
      GridveganRestoItemModel(
        veganRestoOne: ImageConstant.imgRestaurantImage,
        restoname: "Vegan Resto",
        time: "12 Mins",
      ),
      GridveganRestoItemModel(
        veganRestoOne: ImageConstant.imgRestaurantImage,
        restoname: "Healthy Food",
        time: "8 Mins",
      ),
      GridveganRestoItemModel(
        veganRestoOne: ImageConstant.imgRestaurantImage88x86,
        restoname: "Good Food",
        time: "12 Mins",
      ),
      GridveganRestoItemModel(
        veganRestoOne: ImageConstant.imgTelevisionGray40003,
        restoname: "Smart Resto",
        time: "8 Mins",
      ),
      GridveganRestoItemModel(
        veganRestoOne: ImageConstant.imgRestaurantImage100x82,
        restoname: "Healthy Food",
        time: "8 Mins",
      ),
    ];
  }

  Future<void> _onInitialize(
    ExploreRestaurantInitialEvent event,
    Emitter<ExploreRestaurantState> emit,
  ) async {
    emit(
      state.copyWith(
        searchController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        exploreRestaurantModelObj: state.exploreRestaurantModelObj?.copyWith(
          gridveganRestoItemList: fillGridveganRestoItemList(),
        ),
      ),
    );
  }
}
