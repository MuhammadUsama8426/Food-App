part of 'sign_in_bloc.dart';

/// Represents the state of SignIn in the application.
class SignInState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? username;
  final SignInModel? signInModelObj;
  final auth = FirebaseAuth.instance;

  SignInState({
    this.emailController,
    this.passwordController,
    this.signInModelObj,
    this.username,
  });

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        signInModelObj,
        username,
      ];

  SignInState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    SignInModel? signInModelObj,
    String? username,
  }) {
    return SignInState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      signInModelObj: signInModelObj ?? this.signInModelObj,
      username: username ?? this.username,
    );
  }
}
