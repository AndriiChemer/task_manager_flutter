class UserRequest {
  final String email;
  final String password;

  UserRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}