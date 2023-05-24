import 'package:bloodbond/data/dtos/auth/refresh_token.dto.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.dto.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseDTO {
  LoginResponseDTO({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDTOFromJson(json);

  final UserModel user;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  RefreshTokenDTO toRefreshTokenDTO() {
    return RefreshTokenDTO(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
    );
  }
}
