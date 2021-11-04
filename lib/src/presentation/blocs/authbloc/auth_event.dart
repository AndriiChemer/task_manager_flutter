part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginButtonClickEvent extends AuthEvent {
  final String email;
  final String password;

  LoginButtonClickEvent({required this.email, required this.password});
}

class RegistrationButtonClickEvent extends AuthEvent {
  final String email;
  final String password;

  RegistrationButtonClickEvent({required this.email, required this.password});
}
