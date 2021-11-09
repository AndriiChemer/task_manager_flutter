import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/login/login_form_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/registration/registration_form_page.dart';

part 'auth_page_type.dart';

class AuthPage extends HookWidget {
  static const String id = "/login_registration";

  @override
  Widget build(BuildContext context) {
    final pageType = useState(AuthPageState.login);

    final switchCallback = useCallback((value) {
      if(pageType.value == AuthPageState.login) {
        pageType.value = AuthPageState.registration;
      } else {
        pageType.value = AuthPageState.login;
      }

    }, [pageType]);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40,),
            child: pageType.value == AuthPageState.login
                ? LoginFormPage(switchCallback)
                : RegistrationFormPage(switchCallback)
          ),
        ),
      ),
    );
  }
}