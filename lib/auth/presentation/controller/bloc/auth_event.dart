part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final UserModel user;
  const LoginEvent({required this.user});
  @override
  List<Object> get props => [
        user,
      ];
}

final class SignUpEvent extends AuthEvent {
  final UserModel user;
  const SignUpEvent({required this.user});
  @override
  List<Object> get props => [
        user,
      ];
}

final class TogglePasswordVisibility  extends AuthEvent {
  TogglePasswordVisibility ();
  @override
  List<Object> get props => [];
}
