part of 'onboarding_bloc.dart';

/// Represents the state of Onboarding in the application.
class OnboardingState extends Equatable {
  OnboardingState({this.onboardingModelObj});

  OnboardingModel? onboardingModelObj;

  @override
  List<Object?> get props => [onboardingModelObj];

  OnboardingState copyWith({OnboardingModel? onboardingModelObj}) {
    return OnboardingState(
      onboardingModelObj: onboardingModelObj ?? this.onboardingModelObj,
    );
  }
}
