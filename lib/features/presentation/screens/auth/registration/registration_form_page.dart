import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page_cubit.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page_state.dart';
import 'package:flutter_task_manager/features/presentation/screens/tasklist/task_list_page.dart';
import 'package:flutter_task_manager/features/presentation/widgets/error_message.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/auth_page.dart';

enum RegistrationFormPageError { emailValidation, passwordValidation }

class RegistrationFormPage extends HookWidget {
  final Function(AuthPageState value) _switchToLoginScreen;
  const RegistrationFormPage(this._switchToLoginScreen);

  @override
  Widget build(BuildContext context) {
    final topSpaceHeight = MediaQuery.of(context).size.height / 6;
    final cubit = useCubit<RegistrationFormPageCubit>();
    final state = useCubitBuilder(cubit);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    useCubitListener<RegistrationFormPageCubit, RegistrationFormPageState>(cubit, (cubit, state, context) =>
        _listener(cubit, state, context));

    final emailError = _getFormMessage(state, RegistrationFormPageError.emailValidation,
            () => context.getString('invalid_email'));

    final passwordError = _getFormMessage(state, RegistrationFormPageError.passwordValidation,
            () => context.getString('invalid_password'));

    return Column(
      children: [
        SizedBox(height: topSpaceHeight,),
        AuthorizationTitleWidget(
            title: context.getString("registration"),
            fontSize: 26,
            fontWeight: FontWeight.w800
        ),
        SizedBox(height: 20,),
        CustomTextFormWidget(
          controller: emailController,
          error: emailError,
          label: context.getString("email"),
          onTextChanged: cubit.updateEmail,
        ),
        SizedBox(height: 10,),
        CustomTextFormWidget(
          controller: passwordController,
          error: passwordError,
          label: context.getString("password"),
          obscureText: true,
          onTextChanged: cubit.updatePassword,
        ),
        SizedBox(height: 10,),
        _buildCredentialSwitch(context),
        SizedBox(height: 10,),
        ButtonWidget(
          textColor: Colors.white,
          buttonColor: Theme.of(context).iconTheme.color,
          isLoading: state.maybeMap(
              processing: (state) => true,
              orElse: () => false
          ),
          title: context.getString("registration_button"),
          onPressed: () => state.maybeMap(
            initial: (state) {
              cubit.registration();
            },
            idle: (state) {
              cubit.registration();
            },
            orElse: () => null
          ),
        ),
      ],
    );
  }

  Widget _buildCredentialSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.getString("login_registration"),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),

        Switch(
            value: true,
            onChanged: (value) {
              _switchToLoginScreen(AuthPageState.registration);
            }
        )
      ],
    );
  }

  String? _getFormMessage(RegistrationFormPageState state, RegistrationFormPageError errorType, String Function() getMessage) {
    return state.maybeMap(
        idle: (state) {
          if(state.errors.contains(errorType)) {
            return getMessage();
          }
          return null;
        },
        orElse: () => null
    );
  }

  void _listener(RegistrationFormPageCubit cubit, RegistrationFormPageState state, BuildContext context) {
    state.maybeMap(
        success: (state) {
          GetIt.instance.get<NavigationService>()
              .pushReplacement(TaskListScreen.id);
        },
        error: (state) {},
        connectionError: (state) {
          context.showNegativeMessage(getConnectionErrorSting(context, state.error));
        },
        orElse: () {}
    );
  }
}
