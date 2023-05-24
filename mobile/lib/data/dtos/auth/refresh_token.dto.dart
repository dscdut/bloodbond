import 'package:bloodbond/common/constants/hive_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.dto.g.dart';

@JsonSerializable()
class RefreshTokenDTO {
  RefreshTokenDTO({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory RefreshTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDTOFromJson(json);

  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  Map<String, dynamic> toJson() => _$RefreshTokenDTOToJson(this);

  Map<String, dynamic> toLocalJson() {
    return {
      HiveKeys.accessToken: accessToken,
      HiveKeys.refreshToken: refreshToken,
      HiveKeys.expiresIn: expiresIn,
    };
  }
}
