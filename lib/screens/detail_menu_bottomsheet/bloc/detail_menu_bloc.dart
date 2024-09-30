import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/detail_menu_model.dart';

part 'detail_menu_event.dart';
part 'detail_menu_state.dart';

/// A bloc that manages the state of DetailMenu according to the event that is dispatched to it.
class DetailMenuBloc extends Bloc<DetailMenuEvent, DetailMenuState> {
  DetailMenuBloc(super.initialState) {
    on<DetailMenuInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DetailMenuInitialEvent event,
    Emitter<DetailMenuState> emit,
  ) async {
    // Your logic here
  }
}
