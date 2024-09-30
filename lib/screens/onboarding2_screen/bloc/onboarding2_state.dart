part of 'onboarding2_bloc.dart';

/// Represents the state of Onboarding in the application.
class Onboarding2State extends Equatable {
  Onboarding2State({this.onboarding2ModelObj});

  Onboarding2Model? onboarding2ModelObj;

  @override
  List<Object?> get props => [onboarding2ModelObj];

  Onboarding2State copyWith({Onboarding2Model? onboarding2ModelObj}) {
    return Onboarding2State(
      onboarding2ModelObj: onboarding2ModelObj ?? this.onboarding2ModelObj,
    );
  }
}
