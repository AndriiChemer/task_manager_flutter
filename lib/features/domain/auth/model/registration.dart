import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.freezed.dart';
@freezed
class Registration with _$Registration {
  factory Registration({
    @Default('') String email,
    @Default('') String password,
  }) = _Registration;

  const Registration._();
}