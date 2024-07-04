part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//? login states
final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {
  final String message;
  const LoginErrorState({required this.message});
  @override
  List<Object> get props => [message];
}


//? signup states

final class SignUpSuccessState extends AuthState {}

final class SignUpErrorState extends AuthState {
  final String message;
  const SignUpErrorState({required this.message});
  @override
  List<Object> get props => [message];
}


//? for loading states

final class LoadingState extends AuthState {}


//? show passwrod state
final class PasswordState extends AuthState {
  final bool isPasswordVisible;
  const PasswordState({ this.isPasswordVisible = false});
  @override
  List<Object> get props => [isPasswordVisible];
}