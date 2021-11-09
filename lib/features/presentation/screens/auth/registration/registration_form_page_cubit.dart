import 'package:flutter_task_manager/core/params/user_request.dart';
import 'package:flutter_task_manager/core/utils/validator.dart';
import 'package:flutter_task_manager/features/domain/auth/model/registration.dart';
import 'package:flutter_task_manager/features/domain/auth/use_case/create_user_usecase.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegistrationFormPageCubit extends Cubit<RegistrationFormPageState> {
  final CreateUserUseCase _createUserUseCase;
  RegistrationFormPageCubit(this._createUserUseCase)
      : super(RegistrationFormPageState.initial());

  Registration _registration = Registration();
  Set<RegistrationFormPageError> _errors = Set<RegistrationFormPageError>();
  bool _shouldEmitValidationDuringTyping = false;

  Future<void> updateEmail(String email) async {
    _registration = _registration.copyWith(email: email);

    final isEmailValid = Validator.emailValidator(email);
    if(!isEmailValid) {
      _errors.add(RegistrationFormPageError.emailValidation);
    } else if(isEmailValid && _errors.contains(RegistrationFormPageError.emailValidation)) {
      _errors.remove(RegistrationFormPageError.emailValidation);
    }

    await _buildIdleState();
  }

  Future<void> updatePassword(String password) async {
    _registration = _registration.copyWith(password: password);

    final isPasswordValid = Validator.passwordValidator(password);
    if(!isPasswordValid) {
      _errors.add(RegistrationFormPageError.passwordValidation);
    } else if(isPasswordValid && _errors.contains(RegistrationFormPageError.passwordValidation)) {
      _errors.remove(RegistrationFormPageError.passwordValidation);
    }

    await _buildIdleState();
  }

  void registration() async {
    if(!_shouldEmitValidationDuringTyping) {
      _shouldEmitValidationDuringTyping = !_shouldEmitValidationDuringTyping;
    }

    await _buildIdleState();

    if(_errors.isNotEmpty) {
      return;
    }

    emit(RegistrationFormPageState.processing());

    try {
      await _createUserUseCase(params: UserRequest(email: _registration.email, password: _registration.password));
      emit(RegistrationFormPageState.success());
    } on GeneralConnectionError catch(e) {
    emit(RegistrationFormPageState.connectionError(e));
    } catch (e, s) {
    print('Sign in failed.\nex: $e\nstacktrace: $s');
    emit(RegistrationFormPageState.error());
    }
  }

  Future<void> _buildIdleState() async {
    if(_shouldEmitValidationDuringTyping) {
      Set<RegistrationFormPageError> errors = Set<RegistrationFormPageError>()..addAll(_errors);
      emit(RegistrationFormPageState.idle(errors));
    }
  }
}
