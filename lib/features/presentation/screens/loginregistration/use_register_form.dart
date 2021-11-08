import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/utils/utils.dart';

//TODO use when we what to show general message like toast or dialog
class _RegisterForm {
  final TextEditingController email;
  final TextEditingController password;

  final bool Function() validate;

  final String error;

  _RegisterForm(
      this.email, this.password, this.validate, this.error);
}

_RegisterForm useRegisterForm() {
  final email = useTextEditingController();
  final password = useTextEditingController();

  final error = useState("");

  final validate = useMemoized(() => () {

    final emailValidationMessage = Validator.emailValidator(email.text);
    final passwordValidationMessage = Validator.passwordValidator(password.text);

    if (emailValidationMessage != null) {
      error.value = emailValidationMessage;
      return false;
    } else if (passwordValidationMessage != null) {
      error.value = passwordValidationMessage;
      return false;
    }
    error.value = "";
    return true;
  });

  return _RegisterForm(email, password, validate, error.value);
}