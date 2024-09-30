part of 'onboarding2_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Onboarding widget.
/// Events must be immutable and implement the [Equatable] interface.

abstract class Onboarding2Event extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Onboarding widget is first created.
class Onboarding2InitialEvent extends Onboarding2Event {
  @override
  List<Object?> get props => [];
}
