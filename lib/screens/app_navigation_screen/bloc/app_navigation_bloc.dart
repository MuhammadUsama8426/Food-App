import 'package:equatable/equatable.dart';
import 'package:my_food_app/screens/app_navigation_screen/models/app_navigation_model.dart';
import '../../../core/app_export.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

/// A bloc that manages the state of App Navigation according to the event that is dispatched to it.
class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc(super.initialState) {
    on<AppNavigationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AppNavigationInitialEvent event,
    Emitter<AppNavigationState> emit,
  ) async {
    // Your logic here
  }
}
