import 'package:equatable/equatable.dart';

import '../../../core/app_export.dart';
import '../models/onboarding_model.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

/// A bloc that manages the state of Onboarding according to the event that is dispatched to it.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(super.initialState) {
    on<OnboardingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardingInitialEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    // Your logic here
  }
}
