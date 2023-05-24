import 'package:json_annotation/json_annotation.dart';

part 'login_by_email_request.dto.g.dart';

@JsonSerializable(createFactory: false)
class LoginByEmailRequestDTO {
  LoginByEmailRequestDTO({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginByEmailRequestDTOToJson(this);
}
