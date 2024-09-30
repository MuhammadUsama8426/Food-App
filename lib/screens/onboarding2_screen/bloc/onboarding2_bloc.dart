import 'package:equatable/equatable.dart';
import 'package:my_food_app/screens/onboarding2_screen/models/onbaording2_model.dart';

import '../../../core/app_export.dart';

part 'onboarding2_event.dart';
part 'onboarding2_state.dart';

/// A bloc that manages the state of Onboarding according to the event that is dispatched to it.
class Onboarding2Bloc extends Bloc<Onboarding2Event, Onboarding2State> {
  Onboarding2Bloc(super.initialState) {
    on<Onboarding2InitialEvent>(_onInitialize);
  }

  _onInitialize(
    Onboarding2InitialEvent event,
    Emitter<Onboarding2State> emit,
  ) async {
    // Your logic here
  }
}
