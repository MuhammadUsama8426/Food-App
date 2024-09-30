part of 'detail_menu_bloc.dart';

/// Represents the state of DetailMenu in the application.
class DetailMenuState extends Equatable {
  DetailMenuState({this.detailMenuModelObj});

  DetailMenuModel? detailMenuModelObj;

  @override
  List<Object?> get props => [detailMenuModelObj];

  DetailMenuState copyWith({DetailMenuModel? detailMenuModelObj}) {
    return DetailMenuState(
      detailMenuModelObj: detailMenuModelObj ?? this.detailMenuModelObj,
    );
  }
}
