import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
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
          listener: _listenAuthState,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40,),
              child: BlocBuilder<CredentialTypeCubit, CredentialTypeState>(
                  builder: (context, state) {
                    print("state: $state");
                    if (state is LoginState) {
                      return LoginFormPage();
                    } else if (state is RegistrationState) {
                      return RegistrationFormPage();
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

  void _openTaskListScreen() {
    GetIt.instance.get<NavigationService>()
        .pushReplacement(LoginRegistrationScreen.id);
  }

  void _listenAuthState(BuildContext context, AuthState state) {
    if(state is SuccessState) {
      _openTaskListScreen();
    } else if(state is FailState) {
      context.showNegativeMessage(state.message);
    }
  }
}

class LogoutButton extends HookWidget {
  final String title;
  final Function callback;

  const LogoutButton(this.title, this.callback);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          var isLoading = state is LoadingState;

          return ButtonWidget(
            textColor: Colors.white,
            buttonColor: Theme.of(context).iconTheme.color,
            isLoading: isLoading,
            title: title,
            onPressed: () {
              callback.call();
            },
          );
        });
  }
}