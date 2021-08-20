part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {}

class FailState extends AuthState {
  final String message;

  FailState(this.message);
}
