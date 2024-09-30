part of 'onboarding1_bloc.dart';

/// Represents the state of Onboarding in the application.
class Onboarding1State extends Equatable {
  Onboarding1State({this.onboarding1ModelObj});

  Onboarding1Model? onboarding1ModelObj;

  @override
  List<Object?> get props => [onboarding1ModelObj];

  Onboarding1State copyWith({Onboarding1Model? onboarding1ModelObj}) {
    return Onboarding1State(
      onboarding1ModelObj: onboarding1ModelObj ?? this.onboarding1ModelObj,
    );
  }
}
