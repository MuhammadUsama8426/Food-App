import 'package:equatable/equatable.dart';

import '../../../core/app_export.dart';

class ListfromItemModel extends Equatable {
  ListfromItemModel({
    this.fromGallery,
    this.orderdetails,
    this.id,
  });

  String? fromGallery;
  String? orderdetails;
  String? id;

  @override
  List<Object?> get props => [fromGallery, orderdetails, id];

  ListfromItemModel copyWith({
    String? fromGallery,
    String? orderdetails,
    String? id,
  }) {
    return ListfromItemModel(
      fromGallery: fromGallery ?? this.fromGallery,
      orderdetails: orderdetails ?? this.orderdetails,
      id: id ?? this.id,
    );
  }
}
