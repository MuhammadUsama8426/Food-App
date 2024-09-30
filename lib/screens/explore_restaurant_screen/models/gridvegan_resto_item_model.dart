import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [gridvegan_resto_item_widget] screen.

// ignore_for_file: must_be_immutable

class GridveganRestoItemModel extends Equatable {
  GridveganRestoItemModel({
    this.veganRestoOne,
    this.restoname,
    this.time,
    this.id,
  }) {
    veganRestoOne = veganRestoOne ?? ImageConstant.imgRestaurantImage;
    restoname = restoname ?? "Vegan Resto";
    time = time ?? "12 Mins";
    id = id ?? "";
  }

  String? veganRestoOne;
  String? restoname;
  String? time;
  String? id;

  GridveganRestoItemModel copyWith({
    String? veganRestoOne,
    String? restoname,
    String? time,
    String? id,
  }) {
    return GridveganRestoItemModel(
      veganRestoOne: veganRestoOne ?? this.veganRestoOne,
      restoname: restoname ?? this.restoname,
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [veganRestoOne, restoname, time, id];
}
