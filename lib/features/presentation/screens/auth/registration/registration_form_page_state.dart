import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_form_page_state.freezed.dart';

@freezed
class RegistrationFormPageState with _$RegistrationFormPageState {

  @Implements(BuildState)
  factory RegistrationFormPageState.initial() = _RegistrationFormPageStateInitial;

  @Implements(BuildState)
  factory RegistrationFormPageState.idle(Set<RegistrationFormPageError> errors) = _RegistrationFormPageStateIdle;

  @Implements(BuildState)
  factory RegistrationFormPageState.processing() = _RegistrationFormPageStateProcessing;

  factory RegistrationFormPageState.error() = _RegistrationFormPageStateError;

  factory RegistrationFormPageState.success() = _RegistrationFormPageStateSuccess;

  factory RegistrationFormPageState.connectionError(GeneralConnectionError error) = _RegistrationFormPageStateConnectionError;
}
