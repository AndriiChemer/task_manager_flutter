import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/config/routes/navigation.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/core/utils/utils.dart';
import 'package:flutter_task_manager/features/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

part 'registration_form_page.dart';

part 'login_form_page.dart';

class LoginRegistrationScreen extends StatelessWidget {
  static const String id = "/login_registration";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is SuccessState) {
              _openTaskListScreen();
            } else if(state is FailState) {
              _showErrorDialogMessage(context, state.message);
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40,),
              child: BlocBuilder<CredentialTypeCubit, CredentialTypeState>(
                  builder: (context, state) {
                    if (state is LoginState) {
                      return _buildLoginForm();
                    } else if (state is RegistrationState) {
                      return _buildRegistrationForm();
                    } else {
                      return Container();
                    }
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return LoginFormPage();
  }

  Widget _buildRegistrationForm() {
    return RegistrationFormPage();
  }

  void _showErrorDialogMessage(BuildContext context, String message) {
    context.showNegativeMessage(message);
  }

  void _openTaskListScreen() {
    GetIt.instance.get<NavigationService>()
        .pushReplacement(LoginRegistrationScreen.id);
  }
}
