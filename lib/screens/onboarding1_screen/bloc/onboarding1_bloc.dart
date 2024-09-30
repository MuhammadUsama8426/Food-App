import 'package:equatable/equatable.dart';

import '../../../core/app_export.dart';
import '../models/onboarding1_model.dart';

part 'onboarding1_event.dart';
part 'onboarding1_state.dart';

/// A bloc that manages the state of Onboarding according to the event that is dispatched to it.
class Onboarding1Bloc extends Bloc<Onboarding1Event, Onboarding1State> {
  Onboarding1Bloc(super.initialState) {
    on<Onboarding1InitialEvent>(_onInitialize);
  }

  _onInitialize(
    Onboarding1InitialEvent event,
    Emitter<Onboarding1State> emit,
  ) async {
    // Your logic here
  }
}
