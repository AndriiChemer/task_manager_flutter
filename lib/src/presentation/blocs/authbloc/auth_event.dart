part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegistrationEvent extends AuthEvent {
  final String email;
  final String password;

  RegistrationEvent({required this.email, required this.password});
}
