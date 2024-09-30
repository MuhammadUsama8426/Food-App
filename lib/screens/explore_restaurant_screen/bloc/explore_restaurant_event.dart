part of 'explore_restaurant_bloc.dart';

/// Abstract class for all events that can be dispatched from the ExploreRestaurant widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class ExploreRestaurantEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ExploreRestaurant widget is first created.
class ExploreRestaurantInitialEvent extends ExploreRestaurantEvent {
  @override
  List<Object?> get props => [];
}
