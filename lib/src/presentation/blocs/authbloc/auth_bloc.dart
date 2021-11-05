import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/domain/usecases/auth/auth_user_usecase.dart';
import 'package:flutter_task_manager/src/domain/usecases/auth/create_user_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final CreateUserUseCase createUserUseCase;
  final AuthUserUseCase authUserUseCase;

  AuthBloc({
    required this.createUserUseCase,
    required this.authUserUseCase,
  }) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is LoginEvent) {
      yield* _mapLoginState(event);
    }

    if(event is RegistrationEvent) {
      yield* _mapRegistrationState(event);
    }
  }

  Stream<AuthState> _mapLoginState(LoginEvent event) async* {
    yield LoadingState();

    final userRequest = UserRequest(email: event.email, password: event.password);
    final dataState = await authUserUseCase(params: userRequest);

    if (dataState is DataSuccess) {
      yield SuccessState();
    }

    if (dataState is DataFailed) {
      yield FailState(dataState.error.toString());
    }
  }

  Stream<AuthState> _mapRegistrationState(RegistrationEvent event) async* {
    yield LoadingState();

    final userRequest = UserRequest(email: event.email, password: event.password);
    final dataState = await createUserUseCase(params: userRequest);

    if (dataState is DataSuccess) {
      yield SuccessState();
    }

    if (dataState is DataFailed) {
      yield FailState(dataState.error.toString());
    }
  }

  onRegistrationClicked(String email, String password) {
    add(RegistrationEvent(email: email, password: password));
  }

  onSignInClicked(String email, String password) {
    add(LoginEvent(email: email, password: password));
  }
}
