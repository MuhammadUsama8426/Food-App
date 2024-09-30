part of 'sign_up_bloc.dart';

/// State for SignUp screen
class SignUpState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController?
      nameformoneController; // Added nameformoneController

  final bool isShowPassword;
  final SignUpModel? signUpModelObj;
  final bool isObscured; // Track the password visibility
  final String? email;
  final String? username;
  final String? password;
  final String? error;
  final void Function(String)? onChanged; // Make onChanged nullable

  final auth = FirebaseAuth.instance;

  SignUpState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.signUpModelObj,
    this.nameformoneController, // Include in constructor
    this.email,
    this.password,
    this.error,
    this.username,
    this.onChanged, // Correct initialization without assignment
    this.isObscured = true,
  });

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        nameformoneController, // Include in props
        onChanged,
        isShowPassword,
        signUpModelObj,
        isObscured,
        email,
        password,
        error,
        username,
      ];

  SignUpState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? nameformoneController, // Added here
    void Function(String)? onChanged, // Added onChanged to copyWith
    bool? isShowPassword,
    SignUpModel? signUpModelObj,
    bool? isObscured, // Track the password visibility
    String? email,
    String? username,
    String? password,
    String? error,
  }) {
    return SignUpState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      nameformoneController: nameformoneController ??
          this.nameformoneController, // Include copy logic
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
      isObscured: isObscured ?? this.isObscured,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      username: username ?? this.username,
      onChanged:
          onChanged ?? this.onChanged, // Ensure onChanged is copied properly
    );
  }
}
