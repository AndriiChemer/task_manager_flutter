import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is LoginButtonClickEvent) {
      yield* _mapLoginState(event);
    }

    if(event is RegistrationButtonClickEvent) {
      yield* _mapRegistrationState(event);
    }
  }

  Stream<AuthState> _mapLoginState(LoginButtonClickEvent event) async* {
    try {
      yield LoadingState();

      var userRequest = UserRequest(event.email, event.password);
      await userRepository.auth(userRequest);

      yield SuccessState();
    } catch(error) {
      yield FailState(error.toString());
    }
  }

  Stream<AuthState> _mapRegistrationState(RegistrationButtonClickEvent event) async* {
    try {
      yield LoadingState();

      var userRequest = UserRequest(event.email, event.password);
      await userRepository.createUser(userRequest);

      yield SuccessState();
    } catch(error) {

      yield FailState(error.toString());
    }
  }

  onRegistrationClicked(String email, String password) {
    add(RegistrationButtonClickEvent(email: email, password: password));
  }

  onSignInClicked(String email, String password) {
    add(LoginButtonClickEvent(email: email, password: password));
  }
}
