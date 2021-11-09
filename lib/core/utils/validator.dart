class Validator {
  static bool emailValidator(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = new RegExp(pattern);

    if (value == null || value.isEmpty) {
      return false;
    } else if(!regex.hasMatch(value)) {
      return false;
    }

    return true;
  }


  static bool passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    if(value.length < 6) {
      return false;
    }

    return true;
  }

}