part of 'app_navigation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// App Navigation widget.
abstract class AppNavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the App Navigation widget is first created.
class AppNavigationInitialEvent extends AppNavigationEvent {
  @override
  List<Object?> get props => [];
}
