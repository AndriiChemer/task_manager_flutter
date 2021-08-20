class Validator {
  static String? emailValidator(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = new RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Field should not be empty';
    } else if(!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }


  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field should not be empty';
    }

    if(value.length < 6) {
      return 'Password must be more then 6 chars';
    }
    return null;
  }

}