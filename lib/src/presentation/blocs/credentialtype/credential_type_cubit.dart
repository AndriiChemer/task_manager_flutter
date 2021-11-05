import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'credential_type_state.dart';

@injectable
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
