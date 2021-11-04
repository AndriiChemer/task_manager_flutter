import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'credential_type_state.dart';

class CredentialTypeCubit extends Cubit<CredentialTypeState> {
  CredentialTypeCubit() : super(LoginState());

  void switchCredentialType() {
    if(state is LoginState) {
      emit(RegistrationState());
    } else {
      emit(LoginState());
    }
  }
}
