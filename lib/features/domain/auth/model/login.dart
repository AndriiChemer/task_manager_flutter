import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
@freezed
class Login with _$Login {
  factory Login({
    @Default('') String email,
    @Default('') String password,
  }) = _Login;

  const Login._();
}