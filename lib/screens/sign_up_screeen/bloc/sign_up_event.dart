part of 'sign_up_bloc.dart';

/// Abstract class for SignUp events
abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial event for SignUp screen
class SignUpInitialEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing password visibility
class ChangePasswordVisibilityEvent extends SignUpEvent {
  final bool value;
  ChangePasswordVisibilityEvent({required this.value});

  @override
  List<Object?> get props => [];
}

/// Event for updating email
class UpdateEmailEvent extends SignUpEvent {
  final String email;
  UpdateEmailEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

/// Event for updating password
class UpdatePasswordEvent extends SignUpEvent {
  final String password;
  UpdatePasswordEvent({required this.password});

  @override
  List<Object?> get props => [password];
}
