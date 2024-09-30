part of 'app_navigation_bloc.dart';

/// Represents the state of App Navigation in the application.
class AppNavigationState extends Equatable {
  AppNavigationState({this.appNavigationModelObj});

  final AppNavigationModel? appNavigationModelObj;

  @override
  List<Object?> get props => [appNavigationModelObj];

  AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) {
    return AppNavigationState(
      appNavigationModelObj:
          appNavigationModelObj ?? this.appNavigationModelObj,
    );
  }
}
