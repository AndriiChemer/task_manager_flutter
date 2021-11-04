class UserRequest {
  final String email;
  final String password;

  //TODO add annotation
  UserRequest({
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}