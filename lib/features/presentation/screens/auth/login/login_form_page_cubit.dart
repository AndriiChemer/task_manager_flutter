import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/params/user_request.dart';
import 'package:flutter_task_manager/core/utils/utils.dart';
import 'package:flutter_task_manager/features/domain/auth/model/login.dart';
import 'package:flutter_task_manager/features/domain/auth/use_case/auth_user_usecase.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/login/login_form_page.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/login/login_form_page_state.dart';

@Injectable()
class LoginFormPageCubit extends Cubit<LoginFormPageState> {
  final AuthUserUseCase _authUserUseCase;
  LoginFormPageCubit(this._authUserUseCase) : super(LoginFormPageState.initial());

  Login _login = Login();
  Set<LoginFormPageError> _errors = Set<LoginFormPageError>();
  bool _shouldEmitValidationDuringTyping = false;
  
  Future<void> updateEmail(String email) async {
    _login = _login.copyWith(email: email);

    final isEmailValid = Validator.emailValidator(email);
    if(!isEmailValid) {
      _errors.add(LoginFormPageError.emailValidation);
    } else if(isEmailValid && _errors.contains(LoginFormPageError.emailValidation)) {
      _errors.remove(LoginFormPageError.emailValidation);
    }

    await _buildIdleState();
  }

  Future<void> updatePassword(String password) async {
    _login = _login.copyWith(password: password);

    final isPasswordValid = Validator.passwordValidator(password);
    if(!isPasswordValid) {
      _errors.add(LoginFormPageError.passwordValidation);
    } else if(isPasswordValid && _errors.contains(LoginFormPageError.passwordValidation)) {
      _errors.remove(LoginFormPageError.passwordValidation);
    }

    await _buildIdleState();
  }

  Future<void> login() async {
    if(!_shouldEmitValidationDuringTyping) {
      _shouldEmitValidationDuringTyping = !_shouldEmitValidationDuringTyping;
    }

    await _buildIdleState();

    if(_errors.isNotEmpty) {
      return;
    }

    emit(LoginFormPageState.processing());

    try {
      await _authUserUseCase(params: UserRequest(email: _login.email, password: _login.password));
      emit(LoginFormPageState.success());
    } on GeneralConnectionError catch(e) {
      emit(LoginFormPageState.connectionError(e));
    } catch (e, s) {
      print('Sign in failed.\nex: $e\nstacktrace: $s');
      emit(LoginFormPageState.error());
    }
  }

  Future<void> _buildIdleState() async {
    if(_shouldEmitValidationDuringTyping) {
      Set<LoginFormPageError> errors = Set<LoginFormPageError>()..addAll(_errors);
      emit(LoginFormPageState.idle(errors));
    }
  }
}
