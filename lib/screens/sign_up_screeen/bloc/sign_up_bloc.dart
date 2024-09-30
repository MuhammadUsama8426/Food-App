import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_export.dart';
import '../models/sign_up_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// Bloc for handling the SignUp logic
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(super.initialState) {
    on<SignUpInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(
        _onChangePasswordVisibility); // Listen for password visibility change
  }
  void _onChangePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        isShowPassword: event.value)); // Toggle password visibility
  }

  Future<void> _onInitialize(
    SignUpInitialEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        nameformoneController:
            TextEditingController(), // Initialize the controller
        isShowPassword: true,
        // email: onChanged,
        onChanged: (value) {
          // Use copyWith to update the username field in the state
          emit(state.copyWith(username: value));
        },
      ),
    );
  }
}
