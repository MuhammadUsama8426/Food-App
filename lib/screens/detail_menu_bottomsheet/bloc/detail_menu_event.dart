part of 'detail_menu_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// DetailMenu widget.
/// Events must be immutable and implement the [Equatable] interface.

abstract class DetailMenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DetailMenu widget is first created.
class DetailMenuInitialEvent extends DetailMenuEvent {
  @override
  List<Object?> get props => [];
}
