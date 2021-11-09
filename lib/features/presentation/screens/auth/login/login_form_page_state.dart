import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/login/login_form_page.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_page_state.freezed.dart';

@freezed
class LoginFormPageState with _$LoginFormPageState {

  @Implements(BuildState)
  factory LoginFormPageState.initial() = _LoginFormPageStateInitial;

  @Implements(BuildState)
  factory LoginFormPageState.idle(Set<LoginFormPageError> errors) = _LoginFormPageStateIdle;

  @Implements(BuildState)
  factory LoginFormPageState.processing() = _LoginFormPageStateProcessing;

  factory LoginFormPageState.error() = _LoginFormPageStateError;

  factory LoginFormPageState.success() = _LoginFormPageStateSuccess;

  factory LoginFormPageState.connectionError(GeneralConnectionError error) = _LoginFormPageStateConnectionError;
}
