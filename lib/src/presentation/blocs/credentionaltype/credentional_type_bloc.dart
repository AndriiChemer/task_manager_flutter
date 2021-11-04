import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'credentional_type_event.dart';
part 'credentional_type_state.dart';

class LoginRegistrationBloc extends Bloc<LoginRegistrationEvent, LoginRegistrationState> {
  LoginRegistrationBloc() : super(LoginState());

  @override
  Stream<LoginRegistrationState> mapEventToState(
    LoginRegistrationEvent event,
  ) async* {
    if(event is TypeSwitchEvent) {
      yield* _mapTypeState();
    }
  }

  Stream<LoginRegistrationState> _mapTypeState() async* {
    if(state is LoginState) {
      yield RegistrationState();
    } else {
      yield LoginState();
    }
  }

  void switchForm() {
    add(TypeSwitchEvent());
  }
}
