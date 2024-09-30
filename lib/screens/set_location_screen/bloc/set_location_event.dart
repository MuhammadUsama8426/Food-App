part of 'set_location_bloc.dart';

/// Abstract class for all events that can be dispatched from the SetLocation widget.
/// Events must be immutable and implement the [Equatable] interface.

abstract class SetLocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SetLocation widget is first created.
class SetLocationInitialEvent extends SetLocationEvent {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Set Location button is pressed.
class SetLocationButtonPressedEvent extends SetLocationEvent {
  final BuildContext context; // Add context here

  SetLocationButtonPressedEvent(this.context);
  @override
  List<Object?> get props => [];
}
