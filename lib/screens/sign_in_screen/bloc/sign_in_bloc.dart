import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/screens/sign_in_screen/models/sign_in_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// A bloc that manages the state of a SignIn according to the event.
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInState signInState) : super(SignInState()) {
    on<SignInInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    SignInInitialEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      ),
    );
  }

  // Consider adding another method for username change if needed
}
