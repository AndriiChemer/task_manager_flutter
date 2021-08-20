import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/notifiers/notifiers.dart';

class AuthStateCubit extends Cubit<bool> {
  final AuthNotifier authNotifier;

  AuthStateCubit({required this.authNotifier}) : super(true) {
   listenAuthentication();
  }

  void listenAuthentication() {
    authNotifier.addListener(() {
      emit(authNotifier.isUserAuthorized);
    });
  }
}
