part of 'sign_in_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// SignUp widget.
/// Events must be immutable and implement the [Equatable] interface.

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitialEvent extends SignInEvent {
  @override
  List<Object?> get props => [];
}
