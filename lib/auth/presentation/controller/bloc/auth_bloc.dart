import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/auth/data/models/user_model.dart';
import 'package:movies_app/auth/domain/usecases/logout_usecase.dart';
import 'package:movies_app/auth/domain/usecases/signin_usecse.dart';
import 'package:movies_app/auth/domain/usecases/signup_usecase.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUsecse signinUsecse;
  final SignupUsecase signupUsecse;
  final LogoutUsecase logoutUsecase;
  AuthBloc({
    required this.signinUsecse,
    required this.signupUsecse,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signup);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

//? login function logic
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    try {
      final result = await signinUsecse.call(
        AuthParameter(email: event.user.email, password: event.user.password),
      );

      result.fold((failure) => emit(LoginErrorState(message: failure.message)),
          (user) => emit(LoginSuccessState()));
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }

//? signup function logic
  FutureOr<void> _signup(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    try {
      final result = await signupUsecse.call(AuthParameter(
          email: event.user.email, password: event.user.password));
      result.fold((failure) => emit(SignUpErrorState(message: failure.message)),
          (user) => emit(SignUpSuccessState()));
    } catch (e) {
      emit(SignUpErrorState(message: e.toString()));
    }
  }

//? show password function logic @override
  //? toggle password visibility function logic
  FutureOr<void> _togglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<AuthState> emit) async {
    if (state is PasswordState) {
      final currentState = state as PasswordState;
      emit(PasswordState(isPasswordVisible: !currentState.isPasswordVisible));
    } else {
      emit(PasswordState(isPasswordVisible: true));
    }
  }
}
