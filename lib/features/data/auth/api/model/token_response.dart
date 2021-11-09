import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable(createToJson: true)
class TokenResponse {
  final String token;

  TokenResponse(this.token);

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}